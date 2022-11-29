package com.myspring.order_closing.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.order_closing.vo.OrderClosingVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;
import com.myspring.systemmag.vo.itemVO;

public interface OrderClosingDAO {

	List selectAllClosingList(String startDate, String endDate) throws Exception;

	void delClosing(String[] noary) throws DataAccessException;

	int addClosing(OrderClosingVO vo) throws DataAccessException;

	void updateOrderClosing(String[] noary) throws DataAccessException;

	int updateClosing(OrderClosingVO vo) throws DataAccessException;

	List itemList() throws Exception;

	List<itemVO> NameSearch(String itemName);

	List buyerList() throws Exception;

	List<SystemmagVOMJ> buyerSearch(String buyer);

}
