package com.naver.toqur54.service;

import java.util.ArrayList;

import com.naver.toqur54.entities.User;

public interface UserDao {
	int selectConfirm(String code);
	int insertRow(User user);
	ArrayList<User> selectAll();
	User selectOne(String code);
	int updateRow(User member);
	int deleteRow(String code);
}
