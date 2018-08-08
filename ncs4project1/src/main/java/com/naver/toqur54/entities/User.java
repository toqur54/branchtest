package com.naver.toqur54.entities;

import org.springframework.stereotype.Controller;

import lombok.Data;

@Data
@Controller
public class User {
	private String code;
	private String name;
	private int age;
	private String gender;
}
