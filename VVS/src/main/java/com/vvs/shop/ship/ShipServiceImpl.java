package com.vvs.shop.ship;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ShipServiceImpl")
public class ShipServiceImpl implements ShipService {
	final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ShipDaoImpl shipDao;
	
	@Override
	public int doInsert(ShipVO shipVO) {
		// TODO Auto-generated method stub
		return shipDao.doInsert(shipVO);
	}

	@Override
	public int doDelete(ShipVO shipVO) {
		// TODO Auto-generated method stub
		return shipDao.doDelete(shipVO);
	}

	@Override
	public int doUpdate(ShipVO shipVO) {
		// TODO Auto-generated method stub
		return shipDao.doUpdate(shipVO);
	}

	@Override
	public ShipVO doSelectOne(ShipVO shipVO) {
		// TODO Auto-generated method stub
		return shipDao.doSelectOne(shipVO);
	}

	@Override
	public List<ShipVO> doSelectList(ShipVO shipVO) {
		// TODO Auto-generated method stub
		return shipDao.doSelectList(shipVO);
	}

}
