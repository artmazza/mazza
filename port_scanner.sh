#!/bin/bash
#Author: Art Mazza
#Last Updated: 21/05/2019


#Defining the variables

host=$1
firstport=$2
lastport=$3


#Please enter the IP or hostname in the below array with one white space in between. Do not enter the subnet
read -a arr <<< "192.168.1.123 localhost 216.58.203.110 www.google.com 10.20.30.19"

#Get the ports
echo "What is the first port range?"
read firstport

echo "What is the last port range?"
read lastport

#print banner
echo -------------------------------------------------------
echo "Please wait, scanning remote host(s)..."
echo -------------------------------------------------------
echo 

#checking the ports to see if they are open

echo -e "Host \t\t\tPort \t\tStatus"

function portscan
{
start=$(date +%s)
for i in ${arr[@]}
	do	
	host=$i
	echo -n $i	
		for ((counter=$firstport; counter<=$lastport; counter++))
		do
			(timeout 0.5 bash -c "echo >/dev/tcp/$host/$counter") > /dev/null 2>&1 && echo -e "\t\t$counter \t\t\e[1;32m[Open!]\e[0m" && o=$((o+1)) || echo -e "\t\t$counter \t\t[Closed]" && d=$((d+1))			
			trap control_c SIGINT
			echo -n $i	
		done
		echo -e '\n'
	trap control_c SIGINT
	
done
end=$(date +%s)
runtime=$((end-start))
c=$((d-o))
echo -n "Executed in $runtime seconds," 
echo -n " $o open ports,"
echo " $c closed ports"

}
control_c() {
   exit
}

#run the function
portscan
