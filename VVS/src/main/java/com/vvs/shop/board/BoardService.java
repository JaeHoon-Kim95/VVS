package com.vvs.shop.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vvs.shop.cmn.PageVO;
import com.vvs.shop.cmn.SearchVO;

@Service
public interface BoardService {
	int doInsert(BoardVO boardVO);
	
	List<BoardVO> doSelectList(PageVO pageVO);
	
	BoardVO doSelectOne(BoardVO boardVO);
	
	int doUpdate(BoardVO boardVO);
	
	int doDelete(BoardVO boardVO);
	
	int totalCnt();

}
