package com.vvs.shop.cmn;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "main/index.do", method = RequestMethod.GET)
	public ModelAndView main_view(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main/main");
		return mav;
	}
	
	@RequestMapping(value = "main/fileUp.do", method = RequestMethod.GET)
	public ModelAndView fileUp(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("file/fileUpload");
		return mav;
	}
}
