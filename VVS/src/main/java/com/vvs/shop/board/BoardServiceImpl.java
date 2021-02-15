package com.vvs.shop.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vvs.shop.cmn.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public int doInsert(BoardVO boardVO) {
		
		return boardDao.doInsert(boardVO);
	}

	@Override
	public List<BoardVO> doSelectList(int num, int postNum) {
		
		return boardDao.doSelectList(num, postNum);
	}

	@Override
	public BoardVO doSelectOne(BoardVO boardVO) {
		
		return boardDao.doSelectOne(boardVO);
	}
	
	@Override
	public int totalCnt() {
		
		return boardDao.totalCnt();
	}
	@Override
	public int doUpdate(BoardVO boardVO) {
		
		return boardDao.doUpdate(boardVO);
	}

	@Override
	//int형인 이유는 flag가 성공 1 실패 0으로 나오니까
	public int doDelete(BoardVO boardVO) {
		
		//service 다음은 Dao 잖아 그래서 boardVO = data 값을 dao가 처리해서 이 값을 controller한테 return 해주는 거지
		return boardDao.doDelete(boardVO);
	}

}
