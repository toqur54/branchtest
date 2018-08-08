package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Vender {
	private String code;
	private String name;
	private String busno1; //사업자번호
	private String busno2;
	private String busno3;
	private String ceoname;
	private String zipcode;
	private String newaddr;
	private String oldaddr;
	private String detailaddr;
	private String officeno1; //회사전화번호
	private String officeno2;
	private String officeno3;
	private String bustype;	//업태
	private String busconditions; //종목
}
