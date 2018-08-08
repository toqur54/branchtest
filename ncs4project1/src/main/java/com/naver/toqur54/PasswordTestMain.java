package com.naver.toqur54;

import java.util.Random;

public class PasswordTestMain {

	public static void main(String[] args) {
		Random random = new Random();
		for(int i=0; i<100; i++) {
			String pass = String.format("%04d",random.nextInt(9000));
			System.out.println("pass: "+pass);
		}
		
	}

}
