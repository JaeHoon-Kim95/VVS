package com.vvs.shop.member;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	int doInsert(MemberVO memberVO);
	
	List<MemberVO> doSelectList(MemberVO memberVO);
	
	MemberVO doSelectOne(MemberVO memberVO);
	
	int doUpdate(MemberVO memberVO);
	
	public int doUpdateAddress(MemberVO memberVO);
	
	int doDelete(MemberVO memberVO);
	
	int doMemberIdChk(MemberVO memberVO);
}