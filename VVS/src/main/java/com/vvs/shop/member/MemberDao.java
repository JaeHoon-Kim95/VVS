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
	
	final String NAMESPACE = "com.vvs.shop.member.";
	
	public MemberDao() {
		
	}
	
	public int doInsert(MemberVO memberVO) {
		 LOG.debug("====================");
		 LOG.debug("==doInsert==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doInsert";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==memberVO=="+memberVO);
		 
		 int flag = sqlSessionTemplate.insert(statement, memberVO);
		 LOG.debug("flag"+flag);
		return flag;
	}
	
	public int doMemberIdChk(MemberVO memberVO) {
		 LOG.debug("====================");
		 LOG.debug("==doMemberIdChk==");
		 LOG.debug("====================");
		
		 String statement = NAMESPACE + "doMemberIdChk";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==memberVO=="+memberVO);
		 
		 int result = sqlSessionTemplate.selectOne(statement, memberVO);
		 
		 return result;
	}
	
	public List<MemberVO> doSelectList(MemberVO memberVO){
		
		return null;
	}
	
	public MemberVO doSelectOne(MemberVO memberVO) {
		LOG.debug("====================");
		LOG.debug("==doSelectOne==");
		LOG.debug("====================");
		
		String statement = NAMESPACE + "doSelectOne";
		
		MemberVO outVO = sqlSessionTemplate.selectOne(statement,memberVO);
		LOG.debug("==outVO==" + outVO);
        LOG.debug("==================================================");
        
		return outVO;
	}
	
	public int doUpdate(MemberVO memberVO) {
		 LOG.debug("====================");
		 LOG.debug("==doUpdate==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doUpdate";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==memberVO=="+memberVO);
		 
		 int flag = sqlSessionTemplate.update(statement, memberVO);
		 LOG.debug("flag"+flag);
		return flag;	
	}
	
	public int doUpdateAddress(MemberVO memberVO) {
		 LOG.debug("====================");
		 LOG.debug("==doUpdate==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doUpdateAddress";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==memberVO=="+memberVO);
		 
		 int flag = sqlSessionTemplate.update(statement, memberVO);
		 LOG.debug("flag"+flag);
		return flag;	
	}
	
	public int doDelete(MemberVO memberVO) {	
		LOG.debug("====================");
		 LOG.debug("==doDelete==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doDelete";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==memberVO=="+memberVO);
		 
		 int flag = sqlSessionTemplate.delete(statement, memberVO);
		 LOG.debug("flag"+flag);
		 
		return flag;
	}
}