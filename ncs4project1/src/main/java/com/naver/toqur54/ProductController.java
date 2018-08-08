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

import com.naver.toqur54.entities.Product;
import com.naver.toqur54.service.ProductDao;

@Controller
public class ProductController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	Product product;
	
	@RequestMapping(value = "/product_insert_form", method = RequestMethod.GET)	
	public String product_insert_form() {
		
		return "product/product_insert_form";
	}
	
	//상품 등록
	@RequestMapping(value = "/product_insert", method = RequestMethod.POST)	
	public String product_insert(@ModelAttribute Product product, Model model) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		
		try {
			int result = dao.insertRow(product);
			if(result >0) {
				model.addAttribute("msg","상품이 입력되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
		
		return "member/member_result";
	}
	
	//중복체크
	@RequestMapping(value = "/productConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int productConfirm(@RequestParam String code) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(code);
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		return exists;
	}
	
	//전체검색
	@RequestMapping(value = "/product_search", method = RequestMethod.GET)	
	public String product_search(Model model, String find) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		//전체
		ArrayList<Product> products = dao.selectAll();
		model.addAttribute("products", products);
		
		//find검색
		if(find==null) find="";
		ArrayList<Product> productfind = dao.selectFind(find);
		model.addAttribute("productfind",productfind);

		return "product/product_search";
	}

	//바코드번호 클릭
	@RequestMapping(value = "/product_update", method = RequestMethod.GET)	
	public String product_update(Model model, @RequestParam String code) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		Product product = dao.selectOne(code);
		model.addAttribute("product",product);


		return "product/product_update";
	}
	//update 물품
	@RequestMapping(value = "/product_update_form", method = RequestMethod.POST)	
	public String product_update_form(@ModelAttribute Product product,Model model	) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		int result = dao.updateRow(product);
		try {
			if(result > 0) {
				model.addAttribute("msg","물품이 수정되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
			e.printStackTrace();
		}
		return "member/member_result";
	}

	//물품 삭제
	@RequestMapping(value = "/productDelete", method = RequestMethod.GET)	
	public String salaryDelete(Model model,@RequestParam String code) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		int result = dao.deleteRow(code);
		if(result > 0) {
			model.addAttribute("msg", "물품이 삭제되었습니다.");
		}
		return "member/member_result";
	}
		
}
