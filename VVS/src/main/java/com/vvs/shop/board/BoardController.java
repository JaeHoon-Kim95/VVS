package com.vvs.shop.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vvs.shop.board.BoardVO;

import jdk.internal.org.jline.utils.Log;

@Controller
public class BoardController {
	
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	BoardService boardServiceImpl;
		
	@RequestMapping(value="board/doInsert.do", method = RequestMethod.POST)
	public int doInsert(BoardVO boardVO) {
		LOG.debug("===================");
		LOG.debug("==doInsert.do==");
		LOG.debug("===================");
		
		int flag = boardServiceImpl.doInsert(boardVO);
		LOG.debug("flag"+flag);
		
		return flag;
	}
	
	@RequestMapping(value="board/doSelectList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardVO> doSelectList(BoardVO boardVO) {
		List<BoardVO> outVO = this.boardServiceImpl.doSelectList(boardVO);
			
		return outVO;
	}
	
	
	@RequestMapping(value="board/doSelectOne.do", method = RequestMethod.POST)
	@ResponseBody
	public BoardVO doSelectOne(BoardVO boardVO) {
		BoardVO outVO = this.boardServiceImpl.doSelectOne(boardVO);
		
		return outVO;
	}
	
	@RequestMapping(value="board/doUpdate.do", method = RequestMethod.GET)
	@ResponseBody
	public int doUpdate(BoardVO boardVO) {
		int flag = 0;
				
		return flag;
	}
	
	@RequestMapping(value="board/doDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public int doDelete(BoardVO boardVO) {
		int flag = 0;
		
		return flag;
	}
}
