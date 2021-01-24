package com.vvs.shop.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository("BoardDao")
public class BoardDao {
	final Logger LOG = LoggerFactory.getLogger(BoardDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	final String NAMESPACE = "com.vvs.shop.Board.";
	
	public BoardDao() {
		//디폴트 생성자
	}
			
	public int doInsert(BoardVO boardVO) {
		 LOG.debug("====================");
		 LOG.debug("==doInsert==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doInsert";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==boardVO=="+boardVO);
		 
		 int flag = sqlSessionTemplate.insert(statement, boardVO);
		 LOG.debug("flag"+flag);
		return flag;
	}
	
	public List<BoardVO> doSelectList(BoardVO boardVO){
		
		return null;
	}
	
	public BoardVO doSelectOne(BoardVO boardVO) {
		LOG.debug("====================");
		LOG.debug("==doSelectOne==");
		LOG.debug("====================");
		
		String statement = NAMESPACE + "doSelectOne";
		
		BoardVO outVO = sqlSessionTemplate.selectOne(statement,boardVO);
		LOG.debug("==outVO==" + outVO);
        LOG.debug("==================================================");
        
		return outVO;
	}
	
	public int doUpdate(BoardVO boardVO) {
		int flag = 0;
		
		return flag;		
	}
	
	public int doDelete(BoardVO boardVO) {	
		int flag = 0;
	
		return flag;
	}
}
