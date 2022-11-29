package com.myspring.salesmanage.order.sta.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface OrderStaService {

	//cust
	public List listCusts() throws DataAccessException;
	public List submitCust(String custCode) throws DataAccessException;
	public List listOrder() throws DataAccessException;
}
