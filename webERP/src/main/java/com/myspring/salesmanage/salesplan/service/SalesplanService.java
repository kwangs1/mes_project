package com.myspring.salesmanage.salesplan.service;

import java.sql.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.salesmanage.itemview.vo.ItemViewVO;

public interface SalesplanService {

	//salesplan
	public List listSalesplans() throws DataAccessException;
	
	//item
	public List listItems() throws DataAccessException;
	public List submitItem(String item_code) throws DataAccessException;
}
