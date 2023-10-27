//Test

import java.util.Scanner;

public class Test_file{
  public static void main(String[] args){
    	//Creates an array of size specified by the user, then asks for a list of elements to add to the array
	  
	Scanner input = new Scanner(System.in);
	
	int num = 0;
	System.out.println("Please enter an array length");
        num = input.nextInt();
	int arr[] = new int[num];
	
	System.out.println("Enter numbers to add to array");
	for(int i=0; i<arr.length; i++){
		arr[i] = input.nextInt();
	}

	for(int i: arr){
		System.out.println(i);
	}
  }
}
