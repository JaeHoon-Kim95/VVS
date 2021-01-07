package com.vvs.shop.orders;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class OrdersServiceImpl implements OrdersService {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OrdersDaoImpl ordersDao;
	
	@Override
	public int doInsert(OrdersVO ordersVO) {
		int flag = ordersDao.doInsert(ordersVO);
		return flag;
	}

	@Override
	public int doDelete(OrdersVO ordersVO) {
		int flag = ordersDao.doDelete(ordersVO);
		return flag;
	}

	@Override
	public int doUpdate(OrdersVO ordersVO) {
		int flag = ordersDao.doUpdate(ordersVO);
		return flag;
	}

	@Override
	public OrdersVO doSelectOne(OrdersVO ordersVO) {
		return ordersDao.doSelectOne(ordersVO);
	}

	@Override
	public List<OrdersVO> doSelectList(OrdersVO ordersVO) {
		return ordersDao.doSelectList(ordersVO);
	}

}
