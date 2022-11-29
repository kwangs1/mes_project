package com.myspring.salesmanage.order.sta.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.salesmanage.order.vo.OrderVO;

@Repository("orderStaDAO")
public class OrderStaDAOImpl implements OrderStaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	List<OrderVO> orderList;
	
	//////////////////////popCust
	@Override
	public List selectAllCustList() throws DataAccessException {
		List<OrderVO> orderCustList = null;
		orderCustList = sqlSession.selectList("mappers.erp.allCustForStaOrder");
		return orderCustList;
	}
	
	@Override
	public List submitOrdCust(String custCode) throws DataAccessException {
		List<OrderVO> submitOrderCust = null;
		submitOrderCust = sqlSession.selectList("mappers.erp.submitStaOrdCust", custCode);
		return submitOrderCust;
	}

	@Override
	public List selectOrderList() throws DataAccessException {
		List<OrderVO> orderList = null;
		orderList = sqlSession.selectList("mappers.erp.StaOrderList");
		return orderList;
	}

}
