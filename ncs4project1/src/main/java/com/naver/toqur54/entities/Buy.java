package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Buy {
	private int seq;
	private String vendcode; 
	private String vendname;
	private String yyyy; //yyyy--mm--dd-no-hang
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private String procode;
	private String beforeprocode;
	
	private String proname;
	private int price;
	private int beforeprice;
	private int qty;
	private int beforeqty;
	private String memo;
	private int total;
	
	private int stock;
	
	private String procolumn;		//재고
	private String dealcolumn;	//매입금액
	private String balancecolumn;	//잔액
	
	private String paycolumn;	//지출금액
	
}
