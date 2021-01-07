package com.vvs.shop.ship;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vvs.shop.orders.OrdersVO;

public class ShipController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ShipService shipService;
	
	@RequestMapping(value="ship/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(ShipVO shipVO) {
		return 0;
	}
	
	
	@RequestMapping(value="ship/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int doDelete(ShipVO shipVO) {
		return 0;
	}
	
	@RequestMapping(value="ship/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(ShipVO shipVO) {
		return 0;
	}
	
	@RequestMapping(value="ship/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public OrdersVO doSelectOne(ShipVO shipVO) {
		return null;
	}
	
	@RequestMapping(value="ship/doSelectList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> doSelectList(ShipVO shipVO) {
		return null;
	}
}
