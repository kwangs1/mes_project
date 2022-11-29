package com.myspring.salesmanage.order.sta.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.salesmanage.order.vo.OrderVO;

public interface OrderStaDAO {
	
	//pop
	public List selectAllCustList() throws DataAccessException;
	//sta
	public List selectOrderList() throws DataAccessException;
	public List submitOrdCust(String custCode) throws DataAccessException;
	
}
