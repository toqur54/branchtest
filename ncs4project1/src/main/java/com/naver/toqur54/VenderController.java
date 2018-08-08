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

import com.naver.toqur54.entities.Vender;
import com.naver.toqur54.service.VenderDao;

@Controller
public class VenderController {
	
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	Vender vender;
	
	@RequestMapping(value = "/vender_insert_form", method = RequestMethod.GET)	
	public String vender_insert_form() {
		
		return "vender/vender_insert_form";
	}
	
	//상품 등록
	@RequestMapping(value = "/vender_insert", method = RequestMethod.POST)	
	public String vender_insert(@ModelAttribute Vender vender, Model model) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		try {
			int result = dao.insertRow(vender);
			if(result >0) {
				model.addAttribute("msg","거래처가 추가되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
		
		return "member/member_result";
	}
	
	//중복체크
	@RequestMapping(value = "/venderConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int venderConfirm(@RequestParam String code) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(code);
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		return exists;
	}
	
	//전체검색
	@RequestMapping(value = "/vender_search", method = RequestMethod.GET)	
	public String vender_search(Model model, String find) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		//전체
		ArrayList<Vender> venders = dao.selectAll();
		model.addAttribute("venders", venders);
		
		//find검색
		if(find==null) find="";
		ArrayList<Vender> venderfind = dao.selectFind(find);
		model.addAttribute("venderfind",venderfind);

		return "vender/vender_search";
	}
	
	//상호코드번호 클릭
	@RequestMapping(value = "/vender_update_form", method = RequestMethod.GET)	
	public String vender_update_form(Model model, @RequestParam String code) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		Vender vender = dao.selectOne(code);
		model.addAttribute("vender",vender);

		return "vender/vender_update";
	}
	
	//update 거래처
	@RequestMapping(value = "/vender_update", method = RequestMethod.POST)	
	public String vender_update(@ModelAttribute Vender vender,Model model	) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		int result = dao.updateRow(vender);
		try {
			if(result > 0) {
				model.addAttribute("msg","거래처가 수정되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>update err:"+e.getMessage());
		}
		return "member/member_result";
	}
	
	//거래처 삭제
	@RequestMapping(value = "/venderDelete", method = RequestMethod.GET)	
	public String venderDelete(Model model,@RequestParam String code) {
		VenderDao dao = sqlSessoin.getMapper(VenderDao.class);
		int result = dao.deleteRow(code);
		try {
			if(result > 0) {
				model.addAttribute("msg", "거래처가 삭제되었습니다.");
			}
		}catch (Exception e) {
			System.out.println("--->>delete err:"+e.getMessage());
		}
		return "member/member_result";
	}
	
}
