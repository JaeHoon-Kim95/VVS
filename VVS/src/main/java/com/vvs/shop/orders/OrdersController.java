package com.vvs.shop.orders;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrdersController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	OrdersService ordersService;
	
	@RequestMapping(value="orders/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(OrdersVO ordersVO) {
		return 0;
	}
	
	
	@RequestMapping(value="orders/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int doDelete(OrdersVO ordersVO) {
		return 0;
	}
	
	@RequestMapping(value="orders/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(OrdersVO ordersVO) {
		return 0;
	}
	
	@RequestMapping(value="orders/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public OrdersVO doSelectOne(OrdersVO ordersVO) {
		return null;
	}
	
	@RequestMapping(value="orders/doSelectList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> doSelectList(OrdersVO ordersVO) {
		return null;
	}
}
