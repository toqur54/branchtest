package com.naver.toqur54.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.toqur54.entities.Dept2;
import com.naver.toqur54.entities.Salary;
import com.naver.toqur54.entities.SalaryRoll;

public interface SalaryDao {
	int selectConfirm(String empno);
	int insertRow(Salary salary);
	
	ArrayList<Dept2> selectDept();
	
	ArrayList<Salary> selectAll();
	int updateRow(Salary salary);
	Salary selectOne(String empno);
	int deleteRow(String empno);
	//검색
	int selectRowCount(String find);
	ArrayList<Salary> pageList(String find);
	
	
	//급여계산 roll에 yn = y값넣기
	ArrayList<Salary> selectyn();
	int insertSalaryrollRow(SalaryRoll salaryroll);
	//삭제 후 
	void salaryrollDelete(HashMap rollkey);
	//roll search
	ArrayList<SalaryRoll> selectSalaryRoll();
	//급여년도 find
	ArrayList<SalaryRoll> SalaryRollList(HashMap rollkey);
	//rollup
	ArrayList<SalaryRoll> SalaryRollUp(HashMap rollkey);
	
}
