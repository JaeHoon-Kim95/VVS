package com.vvs.shop.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vvs.shop.board.BoardVO;
import com.vvs.shop.cmn.PageVO;
import com.vvs.shop.cmn.SearchVO;



@Controller
public class BoardController {
	
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	BoardService boardServiceImpl;
	
	@RequestMapping(value="board/moveBoardList.do", method = RequestMethod.GET)
	public String moveBoardList(HttpServletRequest req, HttpServletResponse res) {
		return "board/boardList";
	}
	
	@RequestMapping(value="board/doInsert.do", method = RequestMethod.POST)
	public int doInsert(BoardVO boardVO) {
		LOG.debug("===================");
		LOG.debug("==doInsert.do==");
		LOG.debug("===================");
		
		int flag = boardServiceImpl.doInsert(boardVO);
		LOG.debug("flag"+flag);
		
		return flag;
	}
	
	
	@RequestMapping(value="board/doSelectList.do", method = RequestMethod.GET)
	public ModelAndView doSelectList(@RequestParam("num") int num) {
		PageVO pageVO = new PageVO();
		
		pageVO.setNum(num);
		LOG.debug(""+num);
		pageVO.setCount(boardServiceImpl.totalCnt());
		
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> outVO = this.boardServiceImpl.doSelectList(pageVO.getNum(), pageVO.getPostNum());
		
		LOG.debug("outVO"+outVO);
		
		mav.addObject("outVO", outVO);
		mav.addObject("pageVO", pageVO);
		mav.addObject("select",num);
		mav.setViewName("board/boardList");
		
		
		return mav;
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
	
	//boardServiceImpl에있는 doDelete(boardVO인자)를 flag에 담겠다
	@RequestMapping(value="board/doDelete.do", method = RequestMethod.POST) 
	@ResponseBody
	public int doDelete(BoardVO boardVO) {
		LOG.debug("===================");
		LOG.debug("==doDelete.do==");
		LOG.debug("===================");
		
		boardVO.setRegId("HOONS");
		LOG.debug("boardVO");
		
		//컨트롤러 다음이 서비스 boardServiceImpl에 있는 doDelete 메서드의 결과를 flag에 담아서 view에 리턴
		//boardVO에는 view(.jsp)의 ajax에서 data로 넘겨준 regId가 BoardVO에 regId 변수에 들어감
		//그래서 BoardVO에 있는 변수명(=boardVO)하고 아직스에서 data에 써주는 넘겨주는 값(boardVO)이랑 이름이 같아야 함.
		int flag = boardServiceImpl.doDelete(boardVO);
		
		LOG.debug("flag"+flag);
		
		return flag;
	}
	@RequestMapping(value="board/moveDelete.do",method=RequestMethod.GET)
	public String moveDelete(HttpServletRequest req, HttpServletResponse res){
	return "board/testView";
	}
}
