#!/bin/bash
#Author: Art Mazza
#Last Updated: 21/05/2019

#Defining the variables

host=$1
firstport=$2
lastport=$3


#Please enter the IP or hostname in the below array with one white space in between. Do not enter the subnet
read -a arr <<< "192.168.1.123 localhost 216.58.203.110 www.google.com 10.20.30.19"

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
for i in ${arr[@]}
	do	
	host=$i
	echo -n $i	
		for ((counter=$firstport; counter<=$lastport; counter++))
		do
			(timeout 0.5 bash -c "echo >/dev/tcp/$host/$counter") > /dev/null 2>&1 && echo -e "\t\t$counter \t\t\e[1;32m[Open!]\e[0m" || echo -e "\t\t$counter \t\t[Closed]"
			trap control_c SIGINT
			echo -n $i	
		done
		echo -e '\n'
	trap control_c SIGINT
	
done
}
control_c() {
   exit
}

#run the function
portscan
