package com.vvs.shop.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {

	final static Logger LOG = LoggerFactory.getLogger(ProductDao.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	ProductVO productVO;

	private final String NAMESPACE = "com.vvs.shop.product.";

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

	public List<ProductVO> doSelectList(ProductVO productVO){
		
		LOG.debug("ProductDao - doSelectList");
		LOG.debug("param - productVO : " + productVO);
		
		String statement = NAMESPACE + "doSelectList";
		
		List<ProductVO> outList = sqlSessionTemplate.selectList(statement, productVO);
		
		for(ProductVO vo : outList) {
			LOG.debug("resut - outVO : " + vo);
		}
		
		return outList;
		
	}
	
}
