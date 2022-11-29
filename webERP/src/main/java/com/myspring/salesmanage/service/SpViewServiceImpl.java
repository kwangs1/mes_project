package com.myspring.salesmanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.invenBasicInfo.regItemUnitPrice.vo.iupVO;
import com.myspring.salesmanage.salesplan.dao.SpViewDAO;
import com.myspring.salesmanage.salesplan.vo.spVO;

import org.springframework.transaction.annotation.Propagation;

@Service("spMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class SpViewServiceImpl implements SpViewService{
	@Autowired
	private SpViewDAO spDAO;
	
	@Override
	public List spView() throws DataAccessException {
		List spList = null;
		spList = spDAO.viewSp();
		return spList;
	}

	@Override
	public List popView1() throws DataAccessException {
		List popList = null;
		popList = spDAO.viewPop1();
		return popList;
	}
	@Override
	public List popView2() throws DataAccessException {
		List popList = null;
		popList = spDAO.viewPop2();
		return popList;
	}

	@Override
	public List setText(String itemCode) throws DataAccessException {
		List searchList = null;
		searchList = spDAO.setText(itemCode);
		return searchList;
	}

	@Override
	public List SearchView(String itemCode) throws DataAccessException {
		List searchList = null;
		searchList = spDAO.SearchView(itemCode);
		return searchList;
	}

	@Override
	public List itemSet() throws DataAccessException {
		List itemSet = null;
		return null;
	}

	@Override
	public int addSp(spVO spVO) throws DataAccessException {
		return spDAO.addSp(spVO);
	}
	
	@Override
	public void delSp(String[] itemCodeary) throws DataAccessException{
		spDAO.delSp(itemCodeary);
	}

	@Override
	public int updateSp(spVO spVO) throws DataAccessException {
		return spDAO.updSp(spVO);
	}
	
	@Override
	public List<spVO> searchPopName(String itemName) throws DataAccessException {
		return spDAO.searchPopName(itemName);
	}

	@Override
	public List<spVO> searchPopName2(String itemName) throws DataAccessException {
		return spDAO.searchPopName2(itemName);
	}

}