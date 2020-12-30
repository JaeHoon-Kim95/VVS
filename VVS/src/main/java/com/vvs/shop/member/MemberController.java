package com.vvs.shop.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="member/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(MemberVO memberVO) {
		int flag = 0;
		
		
		return flag;
	}
	
	@RequestMapping(value="member/doSelectList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<MemberVO> doSelectList(MemberVO memberVO) {
		List<MemberVO> outVO = this.memberService.doSelectList(memberVO);
		
		
		return outVO;
	}
	
	@RequestMapping(value="member/doSelectOne.do", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO doSelectOne(MemberVO memberVO) {
		MemberVO outVO = this.memberService.doSelectOne(memberVO);
		
		
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
