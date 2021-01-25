package com.vvs.shop.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class CartController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired CartService cartService;
	
	// 장바구니 삭제하기
	@RequestMapping(value = "cart/doDeleteCart.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDeleteCart(CartVO cartVO) {
		
		LOG.debug("Current controller : cart/doDeleteCart.do");
		
		cartService.doDelete(cartVO);
		
		return null;
		
	}
	
	// 주문하기
	@RequestMapping(value = "cart/doOrder.do", method = RequestMethod.POST)
	@ResponseBody
	public String doOrder(CartVO cartVO) {
		
		LOG.debug("Current controller : cart/doOrder.do");
		
		for(CartVO vo : cartVO.cartList) {
			LOG.debug("vo : " + vo);
			cartService.doUpdate(vo);
		}
		
		return null;
	}
	
	// 카트 리스트
	@RequestMapping(value = "cart/doCartList.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doCartList(CartVO cartVO, HttpServletRequest req) {
		
		LOG.debug("Current controller : product/doCartList.do");
		
		// for Test -----------------------
		// 세션으로 값 찾아 넣을 것.
		HttpSession session = req.getSession();
		session.setAttribute("memId", "cartTest");
		String memberId = (String) session.getAttribute("memId");
		cartVO.setMemberId(memberId);		
		// for Test -----------------------
		
		List<CartVO> outList = cartService.doSelectList(cartVO);
		
		Gson gson = new Gson();
		String json = gson.toJson(outList);
		
		return json;
	}
	
	// 카트 페이지로 이동
	@RequestMapping(value = "cart/moveToCart.do", method = RequestMethod.GET)
	public String moveToCart() {
		
		LOG.debug("Current controller : cart/moveToCart.do");
		
		return "product/Cart";
		
	}
}
