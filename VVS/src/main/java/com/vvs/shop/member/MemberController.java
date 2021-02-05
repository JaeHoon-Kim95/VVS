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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@RequestMapping(value="member/homeBack.do", method = RequestMethod.GET)
	public String homeBack(HttpServletRequest req, HttpServletResponse res) {
		return "main/main";
	}
	
	@RequestMapping(value="member/loginPage.do", method = RequestMethod.GET)	
	public String login(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "member/login";
	}
	@RequestMapping(value="member/memberEdit.do", method = RequestMethod.GET)
	public String memberEdit(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "member/memberEdit";
	}
	@RequestMapping(value="member/editCheck.do", method = RequestMethod.GET)
	public String editCheck(HttpServletRequest req, HttpServletResponse res) {
		return "member/editCheck";
	}
	
	
	
	@RequestMapping(value="member/logout.do", method = RequestMethod.GET)	
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/");
		
		return mv;
	}
	
	@RequestMapping(value="member/registerPage.do", method = RequestMethod.GET)	
	public String register(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "member/register";
	}
	
	@RequestMapping(value="member/doLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public int doLogin(@RequestParam("memberId") String memberId,
						  @RequestParam("memberPw") String memberPw,
						  HttpServletRequest req, HttpServletResponse res) {
		LOG.debug("================");
		LOG.debug("==doLogin.do==");
		LOG.debug("================");
		
		int flag = 0;
		HttpSession httpSession = req.getSession();

		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(memberId);
		memberVO.setMemberPw(memberPw);
		
		MemberVO outVO = memberServiceImpl.doSelectOne(memberVO);
		
		try {
		if(!outVO.getMemberPw().equals(memberVO.getMemberPw())) {
			LOG.debug("Pw 확인하세요");
			flag = 2;		
		}else{
			LOG.debug("로그인 성공");
			httpSession.setAttribute("MemberVO", outVO);
			flag = 1;
		}
		}catch(NullPointerException e) {
			LOG.debug("존재하지 않는 ID");
			flag = 3;		
		}
			LOG.debug(flag+"");
		return flag;
	}
	
	@RequestMapping(value="member/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(MemberVO memberVO, HttpServletRequest req) {
		LOG.debug("===================");
		LOG.debug("==doInsert.do==");
		LOG.debug("===================");
		
		memberVO.setAuth(1);
		
		HttpSession httpSession = req.getSession();			
		int flag = memberServiceImpl.doInsert(memberVO);
		
		if(flag == 1) {
		httpSession.setAttribute("MemberVO", memberVO);
		}else {
			LOG.debug("MemberVO"+memberVO);
		}
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
	
	@RequestMapping(value="member/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(MemberVO memberVO,  HttpServletRequest req) {
		LOG.debug("===================");
		LOG.debug("==doUpdate.do==");
		LOG.debug("===================");
		
		HttpSession httpSession = req.getSession();
		
		int flag = memberServiceImpl.doUpdate(memberVO);
		
		if(flag==1) {
			httpSession.setAttribute("MemberVO", memberVO);
		}else if(flag==0) {
			LOG.debug("flag"+flag);
		}
		LOG.debug("flag"+flag);
		return flag;
	}
	
	@RequestMapping(value="member/doUpdateAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdateAddress(MemberVO memberVO,  HttpServletRequest req) {
		LOG.debug("===================");
		LOG.debug("==doUpdateAddress.do==");
		LOG.debug("===================");
		
		HttpSession httpSession = req.getSession();
		
		int flag = memberServiceImpl.doUpdateAddress(memberVO);
		
		if(flag==1) {
			httpSession.setAttribute("MemberVO", memberVO);
		}else if(flag==0) {
			LOG.debug("flag"+flag);
		}
		LOG.debug("flag"+flag);
		return flag;
	}
	
	@RequestMapping(value="member/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int doDelete(MemberVO memberVO, HttpServletRequest req) {
		LOG.debug("===================");
		LOG.debug("==doDelete.do==");
		LOG.debug("===================");
		
		HttpSession httpSession = req.getSession();
		memberVO = (MemberVO) httpSession.getAttribute("MemberVO");
		LOG.debug("memberVO"+memberVO);
		
		int flag = memberServiceImpl.doDelete(memberVO);
		LOG.debug("flag"+flag);
		
		httpSession.invalidate();
		return flag;
	}
}