package com.vvs.shop.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService memberServiceImpl;
	
	@RequestMapping(value="member/homeBack.do", method = RequestMethod.GET)
	public String homeBack(HttpServletRequest req, HttpServletResponse res) {
		return "home";
	}
	
	
	@RequestMapping(value="member/registerPage.do", method = RequestMethod.GET)	
	public String register(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "member/register";
	}
	
	
	@RequestMapping(value="member/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(MemberVO memberVO) {
		LOG.debug("===================");
		LOG.debug("==doInsert.do==");
		LOG.debug("===================");
		
		memberVO.setAuth(1);
		
		int flag = memberServiceImpl.doInsert(memberVO);
		LOG.debug("flag"+flag);
		
		return flag;
	}
	@RequestMapping(value="member/doMemberIdChk.do", method = RequestMethod.POST)
	@ResponseBody
	public int doMemberIdChk(MemberVO memberVO) {
		LOG.debug("===================");
		LOG.debug("==doMemberIdChk.do==");
		LOG.debug("===================");
		
		
		int result = memberServiceImpl.doMemberIdChk(memberVO);
		LOG.debug("result"+result);
		
		return result;
	}
	
	@RequestMapping(value="member/doSelectList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<MemberVO> doSelectList(MemberVO memberVO) {
		List<MemberVO> outVO = this.memberServiceImpl.doSelectList(memberVO);
		
		
		return outVO;
	}
	
	@RequestMapping(value="member/doSelectOne.do", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO doSelectOne(MemberVO memberVO) {
		MemberVO outVO = this.memberServiceImpl.doSelectOne(memberVO);
		
		return outVO;
	}
	
	@RequestMapping(value="member/doUpdate.do", method = RequestMethod.GET)
	@ResponseBody
	public int doUpdate(MemberVO memberVO) {
		int flag = 0;
		
		
		return flag;
	}
	
	@RequestMapping(value="member/doDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public int doDelete(MemberVO memberVO) {
		int flag = 0;
		
		
		return flag;
	}
}
