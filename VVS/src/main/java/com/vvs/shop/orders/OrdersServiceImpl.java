package com.vvs.shop.orders;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vvs.shop.cmn.SearchVO;

@Service("OrdersServiceImpl")
public class OrdersServiceImpl implements OrdersService {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OrdersDaoImpl ordersDao;
	
	@Override
	public int doInsert(OrdersVO ordersVO) {
		return ordersDao.doInsert(ordersVO);
	}

	@Override
	public int doDelete(OrdersVO ordersVO) {
		return ordersDao.doDelete(ordersVO);
	}

	@Override
	public int doUpdate(OrdersVO ordersVO) {
		return ordersDao.doUpdate(ordersVO);
	}

	@Override
	public OrdersVO doSelectOne(OrdersVO ordersVO) {
		return ordersDao.doSelectOne(ordersVO);
	}

	@Override
	public List<OrdersProductVO> doSelectList(SearchVO search) {
		return ordersDao.doSelectList(search);
	}

	@Override
	public List<OrdersVO> doSelectList2(OrdersVO ordersVO) {
		
		return ordersDao.doSelectList2(ordersVO);
	}

}
