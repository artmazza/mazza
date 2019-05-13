import java.util.Scanner;

public class Test_file{
  public static void main(String[] args){
    	Scanner input = new Scanner(System.in);
	
	int num = 0;
	System.out.println("Please enter an array length");
        num = input.nextInt();
	int arr[] = new int[num];
	
	for(int i=0; i<arr.length; i++){
		System.out.println("Enter numbers to add to array");
		arr[i] = input.nextInt();
	}
	
  }
}
