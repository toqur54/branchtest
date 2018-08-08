package com.naver.toqur54.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.toqur54.entities.Buy;

public interface BuyDao {
	Buy selectRow(int seq);
	int selectSequenceNo(Buy buy);
	void insertRow(Buy buy);
	ArrayList<Buy> selectBuySearchRollup(HashMap buysearch); //vendcode,yyyy,mm,dd
	
	ArrayList<Buy> selectBuySearchRollupMM(HashMap buysearch); 
	
	//update
	void updateRow(Buy buy);
	//delete
	void deleteRow(Buy buy);
	
}
