package com.vvs.shop.orders;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.vvs.shop.cmn.Message;
import com.vvs.shop.cmn.SearchVO;
import com.vvs.shop.member.MemberVO;

@Controller
public class OrdersController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	OrdersServiceImpl ordersService;

	@RequestMapping(value = "orders/ordersView.do", method = RequestMethod.GET)
	public ModelAndView orderView(HttpServletRequest req) throws ParseException {

		HttpSession session = req.getSession();
		
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		String memberId =  (String) session.getAttribute("memberId");		

		SearchVO search = new SearchVO();
		search.setSearchWord(memberId);
		List<OrdersProductVO> orderList = ordersService.doSelectList(search);
		LOG.debug("orderList===" + orderList);		
		session.setAttribute("orderList", orderList);
		
		//현재시간 Date
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//현재시간을 요청시간의 형태로 format 후 time 가져오기
		curDate = dateFormat.parse(dateFormat.format(curDate));
		long curDateTime = curDate.getTime();
		
		for(int i=0; i<orderList.size(); i++) {
			Date reqDate = new Date();
			String reqDateStr = orderList.get(i).getOrderDt();
			
			//요청시간을 Date로 parsing 후 time가져오기
			reqDate = dateFormat.parse(reqDateStr);
			long reqDateTime = reqDate.getTime();
			long hour = (curDateTime - reqDateTime) / (60 * 60 * 1000);
			
			 if(orderList.get(i).getOrderSt().equals("주문완료")) {
				 if(hour>=3) {
					orderList.get(i).setOrderSt("배송중");
				 }
				 if(hour>=23) {
					orderList.get(i).setOrderSt("배송완료");
				 }
			 }
		}
		 //배송시간

		mav.setViewName("mypage/mypage");
		mav.addObject("orderList", orderList);
		return mav;
	}

	@RequestMapping(value = "orders/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String doInsert(OrdersVO ordersVO, HttpServletRequest req) {
		
		ordersVO.setOrderSt("주문완료");
		LOG.debug("orders doInsert param:" + ordersVO);
		int flag = ordersService.doInsert(ordersVO);
		LOG.debug("orders doInsert flag:" + flag);

		Message message = new Message();
		message.setRegId(flag + "");
		if (flag == 1) {
			message.setMsgContents("주문 완료");
		} else {
			message.setMsgContents("주문 실패");
		}

		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=orders doInsert json=" + json);
		return json;
	}

	@RequestMapping(value = "orders/doDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String doDelete(OrdersVO ordersVO) {
		LOG.debug("orders dodelete param:" + ordersVO);
		int flag = ordersService.doDelete(ordersVO);
		LOG.debug("orders dodelete flag:" + flag);

		Message message = new Message();
		message.setRegId(flag + "");
		if (flag > 0) {
			message.setMsgContents("주문취소");
		} else {
			message.setMsgContents("주문취소 실패");
		}

		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=orders dodelete json=" + json);
		return json;
	}

	@RequestMapping(value = "orders/doUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String doUpdate(OrdersVO ordersVO) {
		int flag = ordersService.doUpdate(ordersVO);

		Message message = new Message();
		message.setRegId(flag + "");
		if (flag == 1) {
			message.setMsgContents("수정완료");
		} else {
			message.setMsgContents("수정 실패");
		}

		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("=orders doUpdate json=" + json);
		return json;
	}

	@RequestMapping(value = "orders/doSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public String doSelectOne(OrdersVO ordersVO) {
		OrdersVO outVO = ordersService.doSelectOne(ordersVO);

		Gson gson = new Gson();
		String json = gson.toJson(outVO);

		return json;
	}

	@RequestMapping(value = "orders/doSelectList2.do", method = RequestMethod.GET)

	@ResponseBody
	public String doSelectList(OrdersVO ordersVO) {
		List<OrdersVO> outVO = ordersService.doSelectList2(ordersVO);

		Gson gson = new Gson();
		String json = gson.toJson(outVO);

		LOG.debug("-------------------------");
		LOG.debug("-json-" + json);
		LOG.debug("-------------------------");

		return json;
	}

}
