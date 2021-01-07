package com.vvs.shop.ship;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;




@Repository("ShipDaoImpl")
public class ShipDaoImpl {
	final static Logger LOG = LoggerFactory.getLogger(ShipDaoImpl.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "com.vvs.shop.ship";
	
	RowMapper rowMapper = new RowMapper<ShipVO>() {
		@Override
		public ShipVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ShipVO outVO = new ShipVO();
			outVO.setMemberId(rs.getString("memberId"));
			outVO.setOrderNum(rs.getInt("orderNum"));
			outVO.setProductNum(rs.getInt("productNum"));
			outVO.setShipCost(rs.getInt("shipCost"));
			outVO.setShipDt(rs.getString("shipDt"));
			outVO.setShipNum(rs.getString("shipNum"));
			
			return outVO;
			
		}
	};
	
	/**
	 * 
	 * @param ordersVO
	 * @return
	 */
	public int doInsert(ShipVO shipVO) {
		LOG.debug("=ShipVO doInsert=");
		//등록 : namespace+id = com.vvs.shop.orders.doInsert
		String statement = NAMESPACE +".doInsert";
		LOG.debug("=ShipVO statement="+statement);
		LOG.debug("=ShipVO param ==="+shipVO);
		
		int flag = sqlSessionTemplate.insert(statement, shipVO);
		
		LOG.debug("-ShipVO doInsert flag=" + flag);
		return flag;
	}
	
	/**
	 * 삭제
	 * @param ordersVO
	 * @return
	 */
	public int doDelete(ShipVO shipVO) {
		LOG.debug("=ShipVO doDelete=");
		//삭제 : namespace+id = com.vvs.shop.orders.doDelete
		String statement = NAMESPACE +".doDelete";
		LOG.debug("=ShipVO statement="+statement);
		LOG.debug("=ShipVO param=="+shipVO);
		
		int flag = sqlSessionTemplate.delete(statement,shipVO);
		LOG.debug("-ShipVO doDelete flag==" + flag);
		return flag;
	}
	
	/**
	 *  수정
	 * @param ordersVO
	 * @return
	 */
	public int doUpdate(ShipVO shipVO) {
		LOG.debug("=ShipVO doUpdate=");
		
		String statement = NAMESPACE + ".doUpdate";
		LOG.debug("=ShipVO statement : "+statement);
		LOG.debug("=ShipVO ordersVO : "+shipVO);
		
		int flag = sqlSessionTemplate.update(statement,shipVO);
		LOG.debug("=ShipVO flag="+flag);
		
		return flag;
	}
	
	/**
	 * 배송 단건조회
	 * @param orderNum
	 * @return
	 */
	public ShipVO doSelectOne(ShipVO shipVO) {
		LOG.debug("=ShipVO doSelectOne=");
		
		//단건조회 : namespace+id = com.vvs.shop.orders.doSelectOne		
		String statement = NAMESPACE +".doSelectOne";
		LOG.debug("=ShipVO statement="+statement);
		LOG.debug("=ShipVO param=="+shipVO);
		
		ShipVO outVO = sqlSessionTemplate.selectOne(statement,shipVO);
		
		LOG.debug("ShipVO doSelectOne outVO = "+outVO);
		
		return outVO;
	}
	
	/**
	 * 배송 전체조회
	 * @param orderNum
	 * @return
	 */
	public List<ShipVO> doSelectList(ShipVO shipVO) {
		LOG.debug("=ShipVO doSelectList=");
		//등록 : namespace+id = com.vvs.shop.orders.doSelectList
		String statement = NAMESPACE +".doSelectList";		
		LOG.debug("=ShipVO statement="+statement);
		LOG.debug("-ShipVO param-\n" + shipVO);
		
		List<ShipVO> list = sqlSessionTemplate.selectList(statement,shipVO);
		
		for(ShipVO vo : list) {
			LOG.debug("=ShipVO doSelectList vo="+vo);
		}
		return list;
	}
}
