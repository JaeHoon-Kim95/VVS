package com.vvs.shop.orders;

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
public class OrdersController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	OrdersService ordersService;
	
	@RequestMapping(value="orders/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String doInsert(OrdersVO ordersVO) {
		
		LOG.debug("orders doInsert param:"+ordersVO);
		int flag = ordersService.doInsert(ordersVO);
		LOG.debug("orders doInsert flag:"+flag);
		
		Message message = new Message();
		message.setRegId(flag + "");
		if (flag == 1) {
			message.setMsgContents("등록");
		} else {
			message.setMsgContents("등록 실패");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=orders doInsert json=" + json);
		return json;
	}
	
	
	@RequestMapping(value="orders/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String doDelete(OrdersVO ordersVO) {
		LOG.debug("orders dodelete param:"+ordersVO);
		int flag = ordersService.doDelete(ordersVO);
		LOG.debug("orders dodelete flag:"+flag);
		
		Message message = new Message();
		message.setRegId(flag + "");
		if (flag > 0) {
			message.setMsgContents("삭제");
		} else {
			message.setMsgContents("삭제 실패");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=orders dodelete json=" + json);
		return json;
	}
	
	@RequestMapping(value="orders/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(OrdersVO ordersVO) {
		int flag = ordersService.doUpdate(ordersVO);
		
		return flag;
	}
	
	@RequestMapping(value="orders/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public OrdersVO doSelectOne(OrdersVO ordersVO) {
		OrdersVO outVO = ordersService.doSelectOne(ordersVO);
		
		return outVO;
	}
	
	@RequestMapping(value="orders/doSelectList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> doSelectList(OrdersVO ordersVO) {
		List<OrdersVO> outVO = ordersService.doSelectList(ordersVO);
		
		return outVO;
	}
}
