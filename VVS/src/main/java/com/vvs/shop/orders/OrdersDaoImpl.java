package com.vvs.shop.orders;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.vvs.shop.cmn.SearchVO;
import com.vvs.shop.product.OptionsVO;


@Repository("OrdersDaoImpl")
public class OrdersDaoImpl {
	final static Logger LOG = LoggerFactory.getLogger(OrdersDaoImpl.class);
		
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	OrdersDaoImpl ordersDao;
	
	private final String NAMESPACE = "com.vvs.shop.orders";
	
	RowMapper rowMapper = new RowMapper<OrdersVO>() {
		@Override
		public OrdersVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrdersVO outVO = new OrdersVO();
			outVO.setOrderNum(rs.getInt("orderNum"));
			outVO.setProductNum(rs.getInt("productNum"));
			outVO.setMemberId(rs.getString("memberId"));
			outVO.setQty(rs.getInt("qty"));
			
			return outVO;
			
		}
	};
	
	/**
	 * 주문 등록
	 * @param ordersVO
	 * @return
	 */
	public int doInsert(OrdersVO ordersVO) {
		LOG.debug("=Orders doInsert=");
		//��� : namespace+id = com.vvs.shop.orders.doInsert
		String statement = NAMESPACE +".doInsert";
		LOG.debug("=Orders statement="+statement);
		LOG.debug("=Orders param ==="+ordersVO);
		
		int flag = sqlSessionTemplate.insert(statement, ordersVO);
		
		LOG.debug("-Orders doInsert flag=" + flag);
		return flag;
	}
	
	/**
	 * 주문삭제
	 * @param ordersVO
	 * @return
	 */
	public int doDelete(OrdersVO ordersVO) {		
		LOG.debug("=Orders doDelete=");
		//���� : namespace+id = com.vvs.shop.orders.doDelete
		String statement = NAMESPACE +".doDelete";
		LOG.debug("=Orders statement="+statement);
		LOG.debug("=Orders param=="+ordersVO);
		
		int flag = sqlSessionTemplate.delete(statement,ordersVO);
		LOG.debug("-Orders doDelete flag==" + flag);
		return flag;
	}
	
	/**
	 * 주문 수정
	 * @param ordersVO
	 * @return
	 */
	public int doUpdate(OrdersVO ordersVO) {
		LOG.debug("=OrdersVO doUpdate=");
		
		String statement = NAMESPACE + ".doUpdate";
		LOG.debug("=Orders statement : "+statement);
		LOG.debug("=Orders ordersVO : "+ordersVO);
		
		int flag = sqlSessionTemplate.update(statement,ordersVO);
		LOG.debug("=Orders flag="+flag);
		
		return flag;
	}
	
	/**
	 * 주문 조회
	 * @param orderNum
	 * @return
	 */
	public OrdersVO doSelectOne(OrdersVO ordersVO) {
		LOG.debug("=Orders doSelectOne=");
		
		//단건조회 : namespace+id = com.vvs.shop.orders.doSelectOne		
		String statement = NAMESPACE +".doSelectOne";
		LOG.debug("=Orders statement="+statement);
		LOG.debug("=Orders param=="+ordersVO);
		
		OrdersVO outVO = sqlSessionTemplate.selectOne(statement,ordersVO);
		
		LOG.debug("Orders doSelectOne outVO = "+outVO);
		
		return outVO;
	}
	
	/**
	 * 주문 조회
	 * @param orderNum
	 * @return
	 */
	public OptionsVO doSelectOneOptions(OptionsVO optionsVO) {
		LOG.debug("=Orders doSelectOne=");
		
		//단건조회 : namespace+id = com.vvs.shop.orders.doSelectOne		
		String statement = NAMESPACE +".doSelectOneOptions";
		LOG.debug("=Orders statement="+statement);
		LOG.debug("=Orders param=="+optionsVO);
		
		OptionsVO outVO = sqlSessionTemplate.selectOne(statement,optionsVO);
		
		LOG.debug("Orders doSelectOne outVO = "+outVO);
		
		return outVO;
	}
	
	/**
	 * 리스트 총 개수
	 * @return
	 */
	public int totalCnt() {
		
		String statement = NAMESPACE + ".totalCnt";
		int flag = sqlSessionTemplate.selectOne(statement);
		
		return flag;
	}
	
	/**
	 * 주문 리스트
	 * @param orderNum
	 * @return
	 */
	public List<OrdersProductVO> doSelectList(int displayPost, int postNum,SearchVO search) {
		LOG.debug("=OrdersVO doSelectList=");
		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		OrdersVO orders = new OrdersVO();
		
		orders.setMemberId(search.getSearchWord());
		data.put("memberId", orders.getMemberId());
		//orders = ordersDao.doSelectOne(orders.getMemberId());
		//��� : namespace+id = com.vvs.shop.orders.doSelectList
		String statement = NAMESPACE +".doSelectList";		
		LOG.debug("=Orders statement="+statement);
		LOG.debug("-Orders param-\n" + orders);
		
		List<OrdersProductVO> list = sqlSessionTemplate.selectList(statement,data);
		LOG.debug("-1234566list" +list );
		/*
		 * for(OrdersVO vo : list) { LOG.debug("=Orders doSelectList vo="+list); }
		 */
		return list;
	}
	
	/**
	 * 주문 리스트
	 * @param orderNum
	 * @return
	 */
	public List<OrdersVO> doSelectList2(OrdersVO ordersVO) {
		LOG.debug("=OrdersVO doSelectList2=");
		
		//��� : namespace+id = com.vvs.shop.orders.doSelectList
		String statement = NAMESPACE +".doSelectList2";		
		LOG.debug("=Orders statement="+statement);
		LOG.debug("-Orders param-\n" + ordersVO);
		
		List<OrdersVO> list = sqlSessionTemplate.selectList(statement,ordersVO);
		LOG.debug("-1234566list" +list );
		
		for(OrdersVO vo : list) { 
			LOG.debug("=Orders doSelectList list="+list); 
			LOG.debug("=Orders doSelectList vo="+vo);
		}
		
		return list;
	}
}

