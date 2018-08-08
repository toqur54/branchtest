package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	private String find;
	private int startrow;
	private int endrow;
	
}
