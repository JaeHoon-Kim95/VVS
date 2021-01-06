package com.vvs.shop.member;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDao")
public class MemberDao {
	final Logger LOG = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	final String NAMESPACE = "com.vvs.shop.member";
	
	public MemberDao() {
		
	}
	
	public int doInsert(MemberVO memberVO) {
		int flag = 0;
		
		return flag;
	}
	
	public List<MemberVO> doSelectList(MemberVO memberVO){
		
		return null;
	}
	
	public MemberVO doSelectOne(MemberVO memberVO) {
		
		return null;
	}
	
	public int doUpdate(MemberVO memberVO) {
		int flag = 0;
		
		return flag;		
	}
	
	public int doDelete(MemberVO memberVO) {	
		int flag = 0;
	
		return flag;
	}
}
