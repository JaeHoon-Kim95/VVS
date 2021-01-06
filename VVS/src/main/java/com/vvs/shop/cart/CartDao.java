package com.vvs.shop.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao {

	final static Logger LOG = LoggerFactory.getLogger(CartDao.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	CartVO cartVO;

	private final String NAMESPACE = "com.vvs.shop.cart.";

	public int doInsert(CartVO cartVO) {

		LOG.debug("CartDao - doInsert");
		LOG.debug("param - cartVO : " + cartVO);

		String statement = NAMESPACE + "doInsert";

		int flag = sqlSessionTemplate.insert(statement, cartVO);

		LOG.debug("result - flag : " + flag);

		return flag;
	}

	public int doDelete(CartVO cartVO) {

		LOG.debug("CartDao - doDelete");
		LOG.debug("param - cartVO : " + cartVO);

		String statement = NAMESPACE + "doDelete";

		int flag = sqlSessionTemplate.delete(statement, cartVO);

		LOG.debug("result - flag : " + flag);

		return flag;
	}

	public int doUpdate(CartVO cartVO) {

		LOG.debug("CartDao - doUpdate");
		LOG.debug("param - cartVO : " + cartVO);

		String statement = NAMESPACE + "doUpdate";

		int flag = sqlSessionTemplate.update(statement, cartVO);

		LOG.debug("result - flag : " + flag);

		return flag;

	}

	public CartVO doSelectOne(CartVO cartVO) {

		LOG.debug("CartDao - doSelectOne");
		LOG.debug("param - cartVO : " + cartVO);

		String statement = NAMESPACE + "doSelectOne";

		CartVO outVO = sqlSessionTemplate.selectOne(statement, cartVO);

		LOG.debug("result - outVO : " + outVO);

		return outVO;
	}

	public List<CartVO> doSelectList(CartVO cartVO) {

		LOG.debug("ProductDao - doSelectList");
		LOG.debug("param - cartVO : " + cartVO);

		String statement = NAMESPACE + "doSelectList";

		List<CartVO> outList = sqlSessionTemplate.selectList(statement, cartVO);

		for (CartVO vo : outList) {
			LOG.debug("resut - outVO : " + vo);
		}

		return outList;

	}
}
