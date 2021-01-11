package com.vvs.shop.ship;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.vvs.shop.cmn.Message;

@Controller
public class ShipController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ShipService shipService;
	
	@RequestMapping(value="ship/shipView.do", method = RequestMethod.GET)
	public String shipView(ShipVO shipVO) {
		return "mypage/mypage";
	}
	
	@RequestMapping(value="ship/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String doInsert(ShipVO shipVO) {
		int flag = shipService.doInsert(shipVO);
		
		Message message = new Message();
		message.setRegId(flag + "");
		if (flag == 1) {
			message.setMsgContents("등록");
		} else {
			message.setMsgContents("등록 실패");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=ship doInsert json=" + json);
		return json;
	}
	
	
	@RequestMapping(value="ship/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String doDelete(ShipVO shipVO) {
		int flag = shipService.doDelete(shipVO);
		
		Message message = new Message();
		message.setRegId(flag + "");
		if (flag > 0) {
			message.setMsgContents("삭제");
		} else {
			message.setMsgContents("삭제 실패");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=ship dodelete json=" + json);
		return json;
	}
	
	@RequestMapping(value="ship/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(ShipVO shipVO) {
		int flag = shipService.doUpdate(shipVO);
		
		return flag;
	}
	
	@RequestMapping(value="ship/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public String doSelectOne(ShipVO shipVO) {
		ShipVO outVO = shipService.doSelectOne(shipVO);
		
		Gson gson = new Gson();
		String json = gson.toJson(outVO);
		
		return json;
	}
	
	@RequestMapping(value="ship/doSelectList.do", method = RequestMethod.GET)
	@ResponseBody
	public String doSelectList(ShipVO shipVO) {
		List<ShipVO> outVO = shipService.doSelectList(shipVO);
		
		Gson gson = new Gson();
		String json = gson.toJson(outVO);
		
		LOG.debug("-------------------------");
		LOG.debug("-json-"+json);
		LOG.debug("-------------------------");
		
		return json;
	}
}
