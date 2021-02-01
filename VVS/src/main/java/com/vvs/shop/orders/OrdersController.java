package com.vvs.shop.orders;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.vvs.shop.cart.CartService;
import com.vvs.shop.cart.CartVO;
import com.vvs.shop.cmn.Message;
import com.vvs.shop.cmn.PageVO;
import com.vvs.shop.cmn.SearchVO;
import com.vvs.shop.member.MemberVO;
import com.vvs.shop.ship.ShipServiceImpl;
import com.vvs.shop.ship.ShipVO;

@Controller
public class OrdersController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	OrdersServiceImpl ordersService;
	
	@Autowired
	ShipServiceImpl shipService; 

	@Autowired 
	CartService cartService;
	
	@RequestMapping(value="cart/doOrder.do", method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView checkoutView(CartVO cartVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		LOG.debug("Current controller : cart/doOrder.do");
		
		for(CartVO vo : cartVO.getCartList()) {
			LOG.debug("vo : " + vo);
			cartService.doUpdate(vo);
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/check_out");
		mav.addObject("outList", cartVO.getCartList());
		return mav;
	}
	
	@RequestMapping(value = "orders/ordersMove.do", method = RequestMethod.GET)
	public String orderMove(HttpServletRequest req, HttpServletResponse res) {
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "orders/ordersView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView orderView(HttpServletRequest req, @RequestParam("num") int num) throws ParseException {
		
		HttpSession session = req.getSession();
		
		PageVO pageVO = new PageVO();
		num=1;
		pageVO.setNum(num);
		pageVO.setCount(ordersService.totalCnt());
		
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO =  (MemberVO) session.getAttribute("MemberVO");		

		SearchVO search = new SearchVO();
		search.setSearchWord(memberVO.getMemberId());
		List<OrdersProductVO> orderList = ordersService.doSelectList(pageVO.getDisplayPost(),pageVO.getPostNum(), search);
		LOG.debug("orderList===" + orderList);		
		session.setAttribute("orderList", orderList);
		
		List<ShipVO> shipList = shipService.doSelectList2(search);
		session.setAttribute("shipList", shipList);
		LOG.debug("shipList===" + shipList);	
		
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
				 if(hour>=48) {
					orderList.get(i).setOrderSt("배송완료");
				 }
			 }
		}
		 //배송시간
				
		mav.addObject("orderList", orderList);
		mav.addObject("shipList", shipList);
		mav.addObject("pageVO", pageVO);
		mav.addObject("select", num);
		mav.setViewName("mypage/mypage");
		
		return mav;
	}

	@RequestMapping(value = "orders/doInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String doInsert(Model model, OrdersVO ordersVO, HttpServletRequest req) throws Exception {
		LOG.debug("ordersVO param:" + ordersVO);
		
		
		Message message = new Message();
		
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		ShipVO shipVO = new ShipVO();
		
		String productNum[]=req.getParameterValues("productNum");
		String qty[]=req.getParameterValues("qty");
		
		LOG.debug("ordersVO qty:" +qty);
		LOG.debug("ordersVO productNum:"+productNum );
		LOG.debug("ordersVO productNum:"+ordersVO.getMemberId() );
		
		for(int i=0; i<productNum.length; i++) {
			ordersVO.setMemberId(ordersVO.getMemberId());
			ordersVO.setOrderSt("주문완료");
			ordersVO.setProductNum(Integer.parseInt(productNum[i]));
			ordersVO.setQty(Integer.parseInt(qty[i]));
			LOG.debug("ordersVO param123123:"+ordersVO );
			int flag = ordersService.doInsert(ordersVO);
			LOG.debug("orders doInsert flag:" + flag);
			message.setRegId(flag + "");
			
			if (flag == 1) {
				message.setMsgContents("주문 완료");
			} else {
				message.setMsgContents("주문 실패");
			}
			
			shipVO.setMemberId(ordersVO.getMemberId());
			shipVO.setProductNum(ordersVO.getProductNum());
			shipService.doInsert(shipVO);
			
			json = gson.toJson(message);
			LOG.debug("=orders doInsert json=" + json);
			
		}
		
		
		HttpSession session = req.getSession();
		return json;	
		
		//if(flag == 1) {
		//	session.setAttribute("OrdersVO", ordersVO);
		//}
		
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
