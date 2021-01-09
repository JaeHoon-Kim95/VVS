package com.vvs.shop.ship;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ShipController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ShipService shipService;
	
	@RequestMapping(value="ship/shipView.do", method = RequestMethod.GET)
	public String shipView(ShipVO shipVO) {
		return "ship/ship";
	}
	
	@RequestMapping(value="ship/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int doInsert(ShipVO shipVO) {
		int flag = shipService.doInsert(shipVO);
		
		return flag;
	}
	
	
	@RequestMapping(value="ship/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int doDelete(ShipVO shipVO) {
		int flag = shipService.doDelete(shipVO);
		
		return flag;
	}
	
	@RequestMapping(value="ship/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int doUpdate(ShipVO shipVO) {
		int flag = shipService.doUpdate(shipVO);
		
		return flag;
	}
	
	@RequestMapping(value="ship/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public ShipVO doSelectOne(ShipVO shipVO) {
		ShipVO outVO = shipService.doSelectOne(shipVO);
		
		return outVO;
	}
	
	@RequestMapping(value="ship/doSelectList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ShipVO> doSelectList(ShipVO shipVO) {
		List<ShipVO> outVO = shipService.doSelectList(shipVO);
		
		return outVO;
	}
}
