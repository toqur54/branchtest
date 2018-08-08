package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Pay {
	private int seq;
	private String vendcode;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private int amount;
	private int beforeamount;
	private String payway;
	private String beforepayway;
	
	private String beforepaywaycolumn;
	private String paywaycolumn;	//교수님방법
	
	private String memo;
	private int total;
	
	private String dealcolumn;	//매입금액
	private String balancecolumn;	//잔액
	
	private String paycolumn;	//지출금액
	private String cashcolumn;	//현금지출금액
	private String cardcolumn;	//카드지출금액
	private String checkcolumn;	//어음지출금액
	private String etccolumn;	//기타지출금액	
}
