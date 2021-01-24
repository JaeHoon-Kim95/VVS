package com.vvs.shop.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public int doInsert(BoardVO boardVO) {
		
		return boardDao.doInsert(boardVO);
	}

	@Override
	public List<BoardVO> doSelectList(BoardVO boardVO) {
		
		return boardDao.doSelectList(boardVO);
	}

	@Override
	public BoardVO doSelectOne(BoardVO boardVO) {
		
		return boardDao.doSelectOne(boardVO);
	}

	@Override
	public int doUpdate(BoardVO boardVO) {
		
		return boardDao.doUpdate(boardVO);
	}

	@Override
	public int doDelete(BoardVO boardVO) {
		
		return boardDao.doDelete(boardVO);
	}

}
