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
import com.vvs.shop.file.FileServiceImpl;
import com.vvs.shop.file.FileVO;
import com.vvs.shop.member.MemberVO;
import com.vvs.shop.product.OptionsVO;
import com.vvs.shop.product.ProductService;
import com.vvs.shop.product.ProductVO;
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
	
	@Autowired
	FileServiceImpl fileServiceImpl;
	
	@Autowired
	ProductService productService;
	
	//상품에서 주문
	@RequestMapping(value="cart/doOrders.do", method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView checkoutView2(OptionsVO optionsVO, CartVO cartVO,ProductVO productVO, FileVO fileVO, HttpServletRequest req) {
			
		HttpSession session = req.getSession();
		
		LOG.debug("Current controller : cart/doOrder.do");
		LOG.debug("cartVO111 : " + cartVO);
		MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
		LOG.debug("memberVO12 : " + memberVO);
		cartVO.setMemberId(memberVO.getMemberId());
		//cartVO.setSeq(165);
		cartVO = cartService.doSelectOne(cartVO);
		LOG.debug("cartService.doSelectOne(cartVO) : " + cartVO);

		productVO.setProductNum(cartVO.getProductNum());
		productVO = productService.doSelectOne(productVO);

		optionsVO.setSeq(cartVO.getOptionSeq());
		optionsVO = ordersService.doSelectOneOptions(optionsVO);
		LOG.debug("ordersService.doSelectOneOptions(optionsVO) : " + optionsVO);
		
		cartVO.setColor(optionsVO.getColor());
		cartVO.setSizes(optionsVO.getSizes());
		cartVO.setPrice(productVO.getPrice());
		cartVO.setProductName(productVO.getProductName());
		
		LOG.debug("cartService.doSelectOne(cartVO) : " + cartVO);
		//파일에서 상품번호 지정
		fileVO.setProductNum(cartVO.getProductNum());
			
		//파일에서 이미지 뽑아오기
		fileVO = fileServiceImpl.doSelectOne(fileVO);
		LOG.debug("fileVO.doSelectOne(cartVO) : " + fileVO);	
		ModelAndView mav = new ModelAndView();
			
		mav.addObject("cartOut", cartVO);
		mav.addObject("fileOut", fileVO);
		mav.setViewName("mypage/check_out2");
		return mav;
	}
	
	//장바구니에서 주문
	@RequestMapping(value="cart/doOrder.do", method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView checkoutView(CartVO cartVO, FileVO fileVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		LOG.debug("Current controller : cart/doOrder.do");
		LOG.debug("cartVO111 : " + cartVO);
		LOG.debug("cartVO11123 : " + cartVO.getCartList());
		for(CartVO vo : cartVO.getCartList()) {
			LOG.debug("vo : " + vo);
			cartService.doUpdate(vo);
		}
		
		//파일에서 상품번호 지정
		for(int i=0; i<cartVO.getCartList().size(); i++) {
			fileVO.setProductNum(cartVO.getCartList().get(i).getProductNum());
		}
		
		//파일리스트에서 이미지 뽑아오기
		List<FileVO> fileList = fileServiceImpl.doSelectList(fileVO);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("outList", cartVO.getCartList());
		mav.addObject("fileList", fileList);
		mav.setViewName("mypage/check_out");
		return mav;
	}
	
	@RequestMapping(value = "orders/ordersMove.do", method = RequestMethod.GET)
	public String orderMove(HttpServletRequest req, HttpServletResponse res) {
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "orders/ordersView.do", method = RequestMethod.GET)
	public ModelAndView orderView(FileVO fileVO, HttpServletRequest req, @RequestParam("num") int num) throws ParseException {
		
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
		
		//파일에서 상품번호 지정
		for(int i=0; i<orderList.size(); i++) {
			fileVO.setProductNum(orderList.get(i).getProductNum());
		}
		
		//파일리스트에서 이미지 뽑아오기
		List<FileVO> fileList = fileServiceImpl.doSelectList(fileVO);
		
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
				 if(hour>=168) {
					 orderList.get(i).setOrderSt("구매확정");
				 }
			 }
		}
		 //배송시간
				
		mav.addObject("orderList", orderList);
		mav.addObject("shipList", shipList);
		mav.addObject("pageVO", pageVO);
		mav.addObject("select", num);
		mav.addObject("fileLi", fileList);
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
