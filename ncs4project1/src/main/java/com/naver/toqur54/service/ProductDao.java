package com.naver.toqur54.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.toqur54.entities.Buy;
import com.naver.toqur54.entities.Pay;
import com.naver.toqur54.entities.Product;

public interface ProductDao {
	int selectConfirm(String code);
	int insertRow(Product product);
	//검색
	ArrayList<Product> selectAll();
	ArrayList<Product> selectFind(String find);
	
	Product selectOne(String code);
	int updateRow(Product product);
	
	int deleteRow(String code);
	
	//저장시 월재고 매입매출
	void buyProductAdd(Buy buy);
	
	//buy update
	void buyProductStockSub(Buy buy);
	
	void payProductSub(Pay pay);
	
	//재고 마감
	void yyyyfinalProduct(HashMap map);
	void mmfinalProduct();
	void ddfinalProduct();
	
}
