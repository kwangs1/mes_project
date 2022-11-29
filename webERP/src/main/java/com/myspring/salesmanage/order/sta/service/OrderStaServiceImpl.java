package com.myspring.salesmanage.order.sta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.salesmanage.order.sta.dao.OrderStaDAO;

@Service("orderStaService")
public class OrderStaServiceImpl implements OrderStaService {

	@Autowired
	private OrderStaDAO orderStaDAO;
	
	@Override
	public List listCusts() throws DataAccessException {
		List orderCustList = null;
		orderCustList = orderStaDAO.selectAllCustList();
		return orderCustList;
	}
	
	@Override
	public List listOrder() throws DataAccessException {
		List orderList = null;
		orderList = orderStaDAO.selectOrderList();
		return orderList;
	}



	@Override
	public List submitCust(String custCode) throws DataAccessException {
		List submitOrderCust = null;
		submitOrderCust = orderStaDAO.submitOrdCust(custCode);
		return submitOrderCust;
	}

}
