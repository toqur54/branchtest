package com.naver.toqur54.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.toqur54.entities.Pay;

public interface PayDao {
	Pay selectRow(int seq);
	int selectSequenceNo(Pay pay);
	void insertRow(Pay pay);
	
	ArrayList<Pay> selectPaySearchRollup(HashMap paysearch);
//	ArrayList<Pay> selectPaySearchRollup(Pay pay);
	ArrayList<Pay> selectPaySearchRollupMM(HashMap paysearch);
	
	//update
	void updateRow(Pay pay);
	//delete
	void deleteRow(Pay pay);
}
