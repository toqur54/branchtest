package com.naver.toqur54.service;

import java.util.ArrayList;

import com.naver.toqur54.entities.Vender;

public interface VenderDao {
	int selectConfirm(String code);
	int insertRow(Vender vender);
	//검색
	ArrayList<Vender> selectAll();
	ArrayList<Vender> selectFind(String find);
	
	Vender selectOne(String code);
	
	int updateRow(Vender vender);
	
	int deleteRow(String code);

}
