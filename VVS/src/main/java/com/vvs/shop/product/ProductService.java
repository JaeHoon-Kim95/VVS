package com.vvs.shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vvs.shop.cmn.SearchVO;

@Service
public class ProductService {

	@Autowired ProductDao productDao;
	
	public int doInsertOptions(OptionsVO optionsVO) {
		return productDao.doInsertOptions(optionsVO);
	}
	
	public List<OptionsVO> doSelectListOptions(OptionsVO optionsVO){
		return productDao.doSelectListOptions(optionsVO);
	}
	
	public List<ProductVO> doSelectListWithPaging(SearchVO searchVO){
		return productDao.doSelectListWithPaging(searchVO);
	}
	
	public int doInsertDetail(ProductDetailVO productDetailVO) {
		return productDao.doInsertDetail(productDetailVO);
	}
	
	public int doInsert(ProductVO productVO) {
		return productDao.doInsert(productVO);
	}
	
	public int doDelete(ProductVO productVO) {
		return productDao.doDelete(productVO);
	}
	
	public int doUpdate(ProductVO productVO) {
		return productDao.doUpdate(productVO);
	}
	
	public ProductVO doSelectOne(ProductVO productVO) {
		return productDao.doSelectOne(productVO);
	}
	
	public List<ProductVO> doSelectList(ProductVO productVO){
		return productDao.doSelectList(productVO);
	}
}
