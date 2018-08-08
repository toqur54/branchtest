package com.naver.toqur54;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.toqur54.entities.User;
import com.naver.toqur54.service.UserDao;

@Controller
public class UserController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private User user;
	
	@RequestMapping(value = "/userConfirm", method = RequestMethod.POST)
	@ResponseBody	//호출한 곳으로 값을 가지고 돌아감
	public int userConfirm(@RequestParam String code) {	//딸려있는 값가져옴	
		System.out.println("---code : "+code);
//		System.out.println("---name : "+name);
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(code);
			System.out.println("------------->>count : "+exists);
			
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		
		return exists;
	}
	
	@RequestMapping(value = "/user_insert_form", method = RequestMethod.GET)	
	public String user_insert_form() {
		return "member/user_insert_form";
	}
	
	@RequestMapping(value = "/user_insert", method = RequestMethod.POST)	
	public String user_insert(@ModelAttribute User user,Model model) {
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		
		try {
			int result = dao.insertRow(user);
			if(result > 0) {
				model.addAttribute("msg", "입력되었습니다.");
			}
			System.out.println("success:"+result);
		} catch (Exception e) {
			System.out.println("--->insert error:"+e.getMessage());
		}
		
		return "member/member_result";
	}
	@RequestMapping(value = "/user_search", method = RequestMethod.GET)	
	public String user_search(Model model) {
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		ArrayList<User> users= dao.selectAll();
		model.addAttribute("users", users);
		
		return "member/user_search";
	}
	
	@RequestMapping(value = "/user_update", method = RequestMethod.GET)	
	public String user_update(Model model,@RequestParam String code) {
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		User user = dao.selectOne(code);
		model.addAttribute("user", user);
		return "member/user_update_form";
	}
	
	@RequestMapping(value = "/user_update_form", method = RequestMethod.POST)	
	public String user_update_form(@ModelAttribute User user,Model model) {
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		int result = dao.updateRow(user);
		if(result > 0) {
			model.addAttribute("msg", "수정되었습니다.");
		}
		return "member/member_result";
	}
	
	@RequestMapping(value = "/user_delete", method = RequestMethod.GET)	
	public String user_delete(Model model,@RequestParam String code) {
		UserDao dao = sqlSessoin.getMapper(UserDao.class);
		int result = dao.deleteRow(code);
		if(result > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
		}
		return "member/member_result";
	}
}


