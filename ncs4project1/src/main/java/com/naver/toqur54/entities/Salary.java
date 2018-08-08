package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Salary {
	private String empno;
	private String dept; //select box option for
	private String name;
	private String input_date;
	private String birth_date;  //date picker
	private int parter; //결혼
	private int dependent20; //select box 20세이하 자녀
	private int dependent60; //1-4 60세이상
	private int desabled; // 장애 4
	private int womanpower; //여자가장 select
	private int pay; //기본급
	private int extra; //수당
	private String yn; // 'y' 'n'
}
