package com.vvs.shop.product;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.vvs.shop.cmn.SearchVO;

@Controller
public class ProductController {

	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired ProductService productService;
	@Autowired SearchVO searchVO;
	
	// 메인 페이지 부르기
	@RequestMapping(value = "product/moveToMainPage.do", method = RequestMethod.GET)
	public ModelAndView moveToMainPage() {
		LOG.debug("Current controller : product/moveToMainPage.do");
		
		SearchVO searchVO = new SearchVO();
		searchVO.setPageSize(6);
		searchVO.setPageNum(1);
		searchVO.setMinPrice(0);
		searchVO.setMaxPrice(0);
		searchVO.setSearchWord("");
		
		LOG.debug("param - searchVO : " + searchVO);
		
		List<ProductVO> outList = productService.doSelectListWithPaging(searchVO);
		int totalNum = productService.doSelectListWithPagingCount(searchVO);
		
		double a = (double) totalNum / (double) searchVO.getPageSize();
		
		double maxPage = Math.ceil(a);
		maxPage /= 1;
		
		for(ProductVO pvo : outList) {
			String categoryName = productService.getCategoryName(pvo.getCategoryNum());
			pvo.setCategoryName(categoryName);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/ProductList");
		mav.addObject("productList", outList);
		mav.addObject("currentPageNum", searchVO.getPageNum());
		mav.addObject("startPageNum", 1);
		mav.addObject("endPageNum", maxPage);
		mav.addObject("searchWord", searchVO.getSearchWord());
		
		return mav;
	}
	
	
	// 옵션 리스트
	@RequestMapping(value = "product/doOptionsList.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doOptionsList(OptionsVO optionsVO) {
		
		LOG.debug("Current controller : product/doOptionsList.do");
		
		List<OptionsVO> outList = productService.doSelectListOptions(optionsVO);
		
		Gson gson = new Gson();
		String json = gson.toJson(outList);
		
		return json;		
		
	}
	
	// 검색
	@RequestMapping(value = "product/doSearch.do", method = RequestMethod.GET)
	public ModelAndView doSearch(@RequestParam("pageNum") int pageNum,
								 @RequestParam("searchWord") String searchWord,
								 @RequestParam("minPrice") int minPrice,
								 @RequestParam("maxPrice") int maxPrice) {
		LOG.debug("Current controller : product/doSearch.do");
		
		SearchVO searchVO = new SearchVO();
		searchVO.setPageSize(6);
		searchVO.setPageNum(pageNum);
		searchVO.setMinPrice(minPrice);
		searchVO.setMaxPrice(maxPrice);
		searchVO.setSearchWord(searchWord);
		
		LOG.debug("param - searchVO : " + searchVO);
		
		List<ProductVO> outList = productService.doSelectListWithPaging(searchVO);
		int totalNum = productService.doSelectListWithPagingCount(searchVO);
		
		double a = (double) totalNum / (double) searchVO.getPageSize();
		
		double maxPage = Math.ceil(a);
		maxPage /= 1;
		
		for(ProductVO pvo : outList) {
			String categoryName = productService.getCategoryName(pvo.getCategoryNum());
			pvo.setCategoryName(categoryName);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/ProductList");
		mav.addObject("productList", outList);
		mav.addObject("currentPageNum", searchVO.getPageNum());
		mav.addObject("startPageNum", 1);
		mav.addObject("endPageNum", maxPage);
		mav.addObject("searchWord", searchVO.getSearchWord());
		
		return mav;
	}
	
	// 상품 상세 페이지로 이동
	@RequestMapping(value = "product/moveToProductDetail.do", method = RequestMethod.GET)
	public ModelAndView moveToProductDetail(@RequestParam("productNum") int productNum) {
		LOG.debug("Current controller : product/moveToProductDetail.do");
		
		ProductVO productVO = new ProductVO();
		productVO.setProductNum(productNum);
		
		ProductVO outVO = new ProductVO();
		outVO = productService.doSelectOne(productVO);
		String categoryName = productService.getCategoryName(outVO.getCategoryNum());		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/ProductDetail");
		mav.addObject("outVO", outVO);
		mav.addObject("categoryName", categoryName);
		
		return mav;
	}
	
	// 상품 등록2
	@RequestMapping(value = "product/doRegistTest.do", method = RequestMethod.POST)
	@ResponseBody
	public String doRegistTest(ProductVO productVO) {
		
		LOG.debug("into vo : " + productVO);
		
		
		
		productService.doInsert(productVO);
		
		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setMainInfo(productVO.getMainInfo());
		productDetailVO.setSemiInfo(productVO.getSemiInfo());
		productDetailVO.setProductNum(productVO.getProductNum());
		
		productService.doInsertDetail(productDetailVO);
		
		for(OptionsVO vo : productVO.optionsList) {
			vo.setProductNum(productVO.getProductNum());
			productService.doInsertOptions(vo);
		}
		
		
		
		return null;
	}
	
	
	
	// 상품 등록
	@RequestMapping(value = "product/doRegist.do", method = RequestMethod.POST)
	public ModelAndView doRegist(@RequestParam("categoryNum") int categoryNum,
							   @RequestParam("productName") String productName,
							   @RequestParam("price") int price,
							   @RequestParam("discountRate") int discountRate,
							   @RequestParam("discount") int discount,
							   @RequestParam("semiInfo") String semiInfo,
							   @RequestParam("mainInfo") String mainInfo) {
		
		ProductVO productVO = new ProductVO();
		productVO.setCategoryNum(categoryNum);
		productVO.setDiscount(discount);
		productVO.setDiscountRate(discountRate);
		productVO.setPrice(price);
		productVO.setProductName(productName);
		productVO.setDiscountPrice(price*discountRate/100);
		productVO.setSemiInfo(semiInfo);
		productVO.setMainInfo(mainInfo);
		
		LOG.debug("productName : " + productName);
		
		productService.doInsert(productVO);
		
		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProductNum(productVO.getProductNum());
		productDetailVO.setSemiInfo(semiInfo);
		productDetailVO.setMainInfo(mainInfo);		
		
		productService.doInsertDetail(productDetailVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/ProductDetail");
		mav.addObject("outVO", productVO);
		
		return mav;
	}
	
	// 상품 등록 페이지로 이동
	@RequestMapping(value = "product/moveToproductRegistPage.do", method = RequestMethod.GET)
	public ModelAndView moveToproductRegistPage() {
		LOG.debug("Current controller : product/moveToproductRegistPage.do");
		
		List<String> categoryList = new ArrayList<String>();
		
		for(Category ca : Category.values()) {
			categoryList.add(ca.getName());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", categoryList);
		mav.addObject("listSize", categoryList.size());
		mav.setViewName("product/ProductRegist");
		
		
		return mav;
	}
	
	// 시작
	@RequestMapping(value = "product/doDev.do", method = RequestMethod.GET)
	public ModelAndView doDev() {
		LOG.debug("Current controller : product/doDev.do");
		
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