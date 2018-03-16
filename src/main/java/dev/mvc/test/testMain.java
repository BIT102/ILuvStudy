package dev.mvc.test;

import java.util.UUID;

public class testMain {

	int result = 0;
	
	void ajaxsuccess(){
		
		int data = 5;
		
		result = data;
	}
	
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		testMain aa = new testMain();
		
		
		
		System.out.println(aa.result);
		
		
		String code = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
				
		System.out.println(code.substring(0, 6));		
	}

}
