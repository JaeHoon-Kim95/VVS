package com.vvs.shop.product;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired ProductService productService;
	
	@RequestMapping(value = "product/doRegist.do", method = RequestMethod.POST)
	public String doRegist(@RequestParam("categoryNum") int categoryNum,
						   @RequestParam("productName") String productName,
						   @RequestParam("price") int price,
						   @RequestParam("discountRate") int discountRate,
						   @RequestParam("discount") int discount) {
		
		ProductVO productVO = new ProductVO();
		productVO.setCategoryNum(categoryNum);
		productVO.setDiscount(discount);
		productVO.setDiscountRate(discountRate);
		productVO.setPrice(price);
		productVO.setProductName(productName);
		productVO.setDiscountPrice(price*discountRate/100);
		
		LOG.debug("productName : " + productName);
		
		productService.doInsert(productVO);
		
		return "product/ProductDetail";
	}
	
	@RequestMapping(value = "product/moveToproductRegistPage.do", method = RequestMethod.GET)
	public String moveToproductRegistPage() {
		LOG.debug("product/moveToproductRegistPage.do");
		
		return "product/ProductRegist";
	}
	
	@RequestMapping(value = "product/doDev.do", method = RequestMethod.GET)
	public ModelAndView doDev() {
		LOG.debug("product/doDev.do");
		
		// need to change SearchVO
		ProductVO productVO = new ProductVO();
		
		List<ProductVO> outList = productService.doSelectList(productVO);
		
		for(ProductVO vo : outList) {
			LOG.debug("vo : " + vo);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/ProductList");
		mav.addObject("productList", outList);
		
		return mav;
		
	}
	
}