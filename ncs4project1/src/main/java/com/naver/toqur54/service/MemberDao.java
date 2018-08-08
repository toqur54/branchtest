package com.naver.toqur54.service;

import java.util.ArrayList;

import com.naver.toqur54.entities.Member;

public interface MemberDao {
	int selectConfirm(String email);
	Member selectOne(String email);
	int insertRow(Member member);
	ArrayList<Member> selectAll();
	int updateRow(Member member);
	int deleteRow(String email);
	Member login(String email);
	//임시비번으로 바꿈
	void updatePassword(Member member);
}
