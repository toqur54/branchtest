package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Person {
	private String id;
	private String name;
	private int age;
	
}
