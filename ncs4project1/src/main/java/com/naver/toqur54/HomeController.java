package com.naver.toqur54;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)	// '/'가 메인역할
	public String home(Locale locale, Model model) {
		
		return "redirect:index";	//views - index.jsp
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)	// '/'가 메인역할
	public String index(Locale locale, Model model) {
		
		return "index";	//views - index.jsp
	}
	
}
