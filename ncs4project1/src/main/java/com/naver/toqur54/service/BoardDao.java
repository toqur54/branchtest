package com.naver.toqur54.service;

import java.util.ArrayList;

import com.naver.toqur54.entities.Board;
import com.naver.toqur54.entities.BoardPaging;

public interface BoardDao {
	int insertRow(Board board);
	ArrayList<Board> pageList(BoardPaging boardpaging);
	int selectRowCount(String find);
	Board selectOne(int b_seq);
	void updateHit(int b_seq);
	int updateRow(Board board);
	int insertReplyRow(Board board);
	void deleteRowseq(int b_seq);
	void deleteRowref(int b_ref);
}
