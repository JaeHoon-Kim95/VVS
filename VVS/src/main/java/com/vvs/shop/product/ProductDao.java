package com.vvs.shop.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vvs.shop.cmn.SearchVO;

@Repository
public class ProductDao {

	final static Logger LOG = LoggerFactory.getLogger(ProductDao.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	ProductVO productVO;
	@Autowired
	ProductDetailVO productDetailVO;

	private final String NAMESPACE = "com.vvs.shop.product.";

	public int doUpdateDetail(ProductVO productVO) {
		LOG.debug("ProductDao - doUpdateDetail");
		LOG.debug("param - ProductVO : " + productVO);
		
		String statement = NAMESPACE + "doUpdateDetail";
		int flag = sqlSessionTemplate.update(statement, productVO);
		
		LOG.debug("result - flag : " + flag);
		
		return flag;
		
	}
	
	public int doSelectListWithPagingCount(SearchVO searchVO) {
		
		LOG.debug("ProductDao - doSelectListWithPagingCount");
		LOG.debug("param - SearchVO : " + searchVO);
		
		String statement = NAMESPACE + "doSelectListWithPagingCount";
		int count = sqlSessionTemplate.selectOne(statement, searchVO);
		
		LOG.debug("result - count : " + count);
		
		return count;
		
	}
	
	public int doInsertOptions(OptionsVO optionsVO) {
		
		LOG.debug("ProductDao - doInsertOptions");
		LOG.debug("param - optionsVO : " + optionsVO);
		
		String statement = NAMESPACE + "doInsertOptions";
		int flag = sqlSessionTemplate.insert(statement, optionsVO);
		
		LOG.debug("result - flag : " + flag);
		
		return flag;
		
	}
	
	public int doInsertDetail(ProductDetailVO productDetailVO) {
		
		LOG.debug("ProductDao - doInsertDetail");
		LOG.debug("param - productDetailVO : " + productDetailVO);
		
		String statement = NAMESPACE + "doInsertDetail";
		int flag = sqlSessionTemplate.insert(statement, productDetailVO);
		
		LOG.debug("result - flag : " + flag);
		
		return flag;
	}
	
	public int doInsert(ProductVO productVO) {

		LOG.debug("ProductDao - doInsert");
		LOG.debug("param - productVO : " + productVO);

		String statement = NAMESPACE + "doInsert";

		int flag = sqlSessionTemplate.insert(statement, productVO);

		LOG.debug("result - flag : " + flag);

		return flag;
	}

	public int doDelete(ProductVO productVO) {

		LOG.debug("ProductDao - doDelete");
		LOG.debug("param - productVO : " + productVO);

		String statement = NAMESPACE + "doDelete";

		int flag = sqlSessionTemplate.delete(statement, productVO);

		LOG.debug("result - flag : " + flag);

		return flag;
	}

	public int doUpdate(ProductVO productVO) {

		LOG.debug("ProductDao - doUpdate");
		LOG.debug("param - productVO : " + productVO);

		String statement = NAMESPACE + "doUpdate";

		int flag = sqlSessionTemplate.update(statement, productVO);

		LOG.debug("result - flag : " + flag);

		return flag;

	}

	public ProductVO doSelectOne(ProductVO productVO) {

		LOG.debug("ProductDao - doSelectOne");
		LOG.debug("param - productVO : " + productVO);

		String statement = NAMESPACE + "doSelectOne";

		ProductVO outVO = sqlSessionTemplate.selectOne(statement, productVO);

		LOG.debug("result - outVO : " + outVO);

		return outVO;
	}

	public List<OptionsVO> doSelectListOptions(OptionsVO optionsVO){
		LOG.debug("ProductDao - doSelectListOptions");
		LOG.debug("param - optionsVO : " + optionsVO);
		
		String statement = NAMESPACE + "doSelectListOptions";
		
		List<OptionsVO> outList = sqlSessionTemplate.selectList(statement, optionsVO);
		
		for(OptionsVO vo : outList) {
			LOG.debug("result - outVO : " + vo);
		}
		
		return outList;
	}
	
	// need to change SearchVO
	public List<ProductVO> doSelectList(ProductVO productVO){
		
		LOG.debug("ProductDao - doSelectList");
		LOG.debug("param - productVO : " + productVO);
		
		String statement = NAMESPACE + "doSelectList";
		
		List<ProductVO> outList = sqlSessionTemplate.selectList(statement, productVO);
		
		for(ProductVO vo : outList) {
			LOG.debug("result - outVO : " + vo);
		}
		
		return outList;
		
	}
	
	public List<ProductVO> doSelectListWithPaging(SearchVO searchVO){
		LOG.debug("ProductDao - doSelectListWithPaging");
		LOG.debug("param - searchVO : " + searchVO);
		
		String statement = NAMESPACE + "doSelectListWithPaging";
		
		List<ProductVO> outList = sqlSessionTemplate.selectList(statement, searchVO);
		
		for(ProductVO vo : outList) {
			LOG.debug("result - outVO : " + vo);
		}
		
		return outList;
		
	}
	
}