package com.myspring.invenBasicInfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.invenBasicInfo.regItemUnitPrice.dao.*;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;

import org.springframework.transaction.annotation.Propagation;

@Service("iupMemberService1")
@Transactional(propagation = Propagation.REQUIRED)

public class IupViewServiceImpl implements IupViewService{
	@Autowired
	private IupViewDAO iupDAO;
	
	@Override
	public List iupView() throws DataAccessException {
		List iupList = null;
		iupList = iupDAO.viewIup();
		return iupList;
	}

	@Override
	public List popView1() throws DataAccessException {
		List popList = null;
		popList = iupDAO.viewPop1();
		return popList;
	}
	@Override
	public List popView2() throws DataAccessException {
		List popList = null;
		popList = iupDAO.viewPop2();
		return popList;
	}

	@Override
	public List setText(String itemNumber) throws DataAccessException {
		List searchList = null;
		searchList = iupDAO.setText(itemNumber);
		return searchList;
	}

	@Override
	public List SearchView(String itemNumber) throws DataAccessException {
		List searchList = null;
		searchList = iupDAO.SearchView(itemNumber);
		return searchList;
	}

	@Override
	public List itemSet() throws DataAccessException {
		List itemSet = null;
		return null;
	}

	@Override
	public int addIup(iupVO iupVO) throws DataAccessException {
		return iupDAO.addIup(iupVO);
	}
	
	@Override
	public void delIup(String[] noary) throws DataAccessException{
		iupDAO.delIup(noary);
	}

	@Override
	public int updateIup(iupVO iupVO) throws DataAccessException {
		return iupDAO.updIup(iupVO);
	}

	@Override
	public int inputNo() throws DataAccessException {
		return iupDAO.selNo();
	}

	@Override
	public List<iupVO> searchPopName(String itemName) throws DataAccessException {
		return iupDAO.searchPopName(itemName);
	}

	@Override
	public List<iupVO> searchPopName2(String itemName) throws DataAccessException {
		return iupDAO.searchPopName2(itemName);
	}
	

}