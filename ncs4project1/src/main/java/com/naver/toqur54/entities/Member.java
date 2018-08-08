package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

//lombok.Data 추가 시 getter/setter x
@Data
@Component
public class Member {
	private String email;
	private String name;
	private String password;
	private String phone1;
	private String phone2;
	private String phone3;
	private String postno;
	private String addr1;
	private String addr2;
	private String inputdate;
	private String photo;
	private String beforephoto;
	
	
}
