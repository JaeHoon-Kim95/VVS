package com.vvs.shop.board;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	int doInsert(BoardVO boardVO);
	
	List<BoardVO> doSelectList(BoardVO boardVO);
	
	BoardVO doSelectOne(BoardVO boardVO);
	
	int doUpdate(BoardVO boardVO);
	
	int doDelete(BoardVO boardVO);
	

}
