package com.vvs.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.vvs.shop.cmn.LoginCheck;

public class AuthLoginInterceptor implements HandlerInterceptor {
	
	
	final static Logger LOG = LoggerFactory.getLogger(AuthLoginInterceptor.class);
	
	//preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
			HttpSession session = request.getSession();
	        MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	 
	
	        if(memberVO == null){
	        	
	            response.sendRedirect("loginPage.do");
	            return false;
	        }
			
			return true;	
				
	}
	
	//컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		

	}

}
