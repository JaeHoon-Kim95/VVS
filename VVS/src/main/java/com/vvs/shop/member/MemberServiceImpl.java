package com.vvs.shop.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public int doInsert(MemberVO memberVO) {
		
		return memberDao.doInsert(memberVO);
	}

	@Override
	public List<MemberVO> doSelectList(MemberVO memberVO) {
		
		return memberDao.doSelectList(memberVO);
	}

	@Override
	public MemberVO doSelectOne(MemberVO memberVO) {
		
		return memberDao.doSelectOne(memberVO);
	}

	@Override
	public int doUpdate(MemberVO memberVO) {
		
		return memberDao.doUpdate(memberVO);
	}

	@Override
	public int doDelete(MemberVO memberVO) {
		
		return memberDao.doDelete(memberVO);
	}

	@Override
	public int doMemberIdChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDao.doMemberIdChk(memberVO);
	}

<<<<<<< HEAD
}
=======
}
>>>>>>> refs/heads/HOON
