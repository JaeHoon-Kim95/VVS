package com.vvs.shop.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vvs.shop.cmn.PageVO;
import com.vvs.shop.cmn.SearchVO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository("BoardDao")
public class BoardDao {
	final Logger LOG = LoggerFactory.getLogger(BoardDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	PageVO pageVO;
	
	final String NAMESPACE = "com.vvs.shop.board.";
	
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
	
	public List<BoardVO> doSelectList(PageVO pageVO){
		

		 String statement = NAMESPACE + "doSelectListP";
		      
		 List<BoardVO> outVO = sqlSessionTemplate.selectList(statement,pageVO);

		 LOG.debug("==outVO==" + outVO);
		 LOG.debug("==================================================");

		return outVO;
	}
	
	
	public int totalCnt() {
		
		String statement = NAMESPACE + "totalCnt";
		int flag = sqlSessionTemplate.selectOne(statement);
		
		return flag;
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
		 LOG.debug("====================");
		 LOG.debug("==doUpdate==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doUpdate";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==boardVO=="+boardVO);
		 
		 int flag = sqlSessionTemplate.update(statement, boardVO);
		 LOG.debug("flag"+flag);
		return flag;	
	}
	
	public int doDelete(BoardVO boardVO) {	
		LOG.debug("====================");
		 LOG.debug("==doDelete==");
		 LOG.debug("====================");
		 
		 String statement = NAMESPACE + "doDelete";
		 
		 LOG.debug("==statement==" + statement);
		 LOG.debug("==boardVO=="+boardVO);
		 
		 int flag = sqlSessionTemplate.insert(statement, boardVO);
		 LOG.debug("flag"+flag);
	
		return flag;
	}
}