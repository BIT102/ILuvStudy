package dev.mvc.test;

import java.util.UUID;

public class testMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		
		
		
		
		String code = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
				
		System.out.println(code.substring(0, 6));		
	}

}
