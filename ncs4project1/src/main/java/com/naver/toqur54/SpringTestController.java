package com.naver.toqur54;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.toqur54.entities.Person;
import com.naver.toqur54.service.PersonDao;

@Controller
public class SpringTestController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Person person;
	
	@RequestMapping(value="/personInsertForm", method = RequestMethod.GET)
	public String personInsertForm() {
		
		return "person/person_insert_form";
	}
	
	@RequestMapping(value="/person_Insert", method = RequestMethod.POST)
	public String person_Insert(@ModelAttribute Person person, Model model) {
		PersonDao dao = sqlSessoin.getMapper(PersonDao.class);

		person.setId(person.getId());
		person.setName(person.getName());
		person.setAge(person.getAge());
		try {
			int result = dao.insertRow(person);
			if(result >0) {
				model.addAttribute("msg", "입력되었습니다.");
				model.addAttribute("person",person);
			}
			System.out.println("success : "+result);
			System.out.println("id:"+person.getId());
			System.out.println("name:"+person.getName());
			System.out.println("age:"+person.getAge());
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
		
		return "person/result";
	}
}
