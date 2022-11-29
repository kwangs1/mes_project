package com.myspring.salesmanage.salesplan.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.salesmanage.itemview.vo.ItemViewVO;
import com.myspring.salesmanage.salesplan.dao.SalesplanDAO;



@Service("salesplanService")
@Transactional(propagation = Propagation.REQUIRED)
public class SalesplanServiceImpl implements SalesplanService{

	@Autowired
	private SalesplanDAO salesplanDAO;

	//salesplan
	@Override
	public List listSalesplans() throws DataAccessException {
		List salesplanList = null;
		salesplanList = salesplanDAO.selectAllSalesplanList();
		return salesplanList;
	}//selectItemList
	
	//item
	@Override
	public List listItems() throws DataAccessException {
		List allItemList = null;
		allItemList = salesplanDAO.selectAllItemList();
		return allItemList;
	}
	@Override
	public List submitItem(String item_code) throws DataAccessException {
		List searchItemList = null;
		searchItemList = salesplanDAO.submitItemView(item_code);
		return searchItemList;
	}//searchitem


}
