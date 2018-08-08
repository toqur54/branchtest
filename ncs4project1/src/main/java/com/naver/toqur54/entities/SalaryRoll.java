package com.naver.toqur54.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SalaryRoll {
	private String yyyy;
	private String mm;
	private String empno;
	private String dept;
	private String name;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay12;
	private int sumpay;
	private int incomededuction; //근로소득공제 변수
	private int incomeamount;	//근로소득금액
	private int personaldeduction; //인적공제
	private int annuityinsurance;  //연금보험료공제
	private int specialdeduction;  //특별소득공제
	private int standardamount;  //과세표준
	private int calculatedtax;		//산출세액
	private int incometaxdeduction;  //근로소득세액공제
	private int decidedtax;		//결정세액
	private int simpletax;		//간이세액
	private int finalpay;
}
