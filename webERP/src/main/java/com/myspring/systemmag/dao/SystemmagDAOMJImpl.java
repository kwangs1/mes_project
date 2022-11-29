package com.myspring.systemmag.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.systemmag.vo.SystemmagVOMJ;

@Repository("SystemmagDAOMJ")
public class SystemmagDAOMJImpl implements SystemmagDAOMJ {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int insertNewCustomer (SystemmagVOMJ systemmagVO) throws DataAccessException{
		int result = sqlSession.insert("mappers.erp.insertNewCustomer",systemmagVO);
		return result;
	}
	
	@Override
	public List searchCustomer(String customerCode) throws DataAccessException {
		List<SystemmagVOMJ> cusList = null;
		cusList = sqlSession.selectList("mappers.erp.selectSearchBasicList", customerCode);
		return cusList;
	}

	@Override
	public List viewAllCustomer() throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectAllBasicList");
		return comList;
	}
	
	@Override
	public List viewCustomer(String com_code) throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectBasicList",com_code);
		return comList;
	}


	@Override
	public void deleteCustomer(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteBasicList", Integer.parseInt(obj));	
		}	
	}

	@Override
	public void updateCustomer(SystemmagVOMJ systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateBasicList", systemmagVO);
	}

	@Override
	public List zipViewCustomer() throws DataAccessException {
		List zipList = null;
		zipList = sqlSession.selectList("mappers.erp.selectZipList1");
		return zipList;
	}
	
	@Override
	public List<SystemmagVOMJ> viewsearchPopName(String itemName) {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopCustomerList",itemName);
		return popList;
	}
	
	@Override
	public List<SystemmagVOMJ> viewsearchPopZipCodeName(String itemName) {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopZipCodeList",itemName);
		return popList;
	}
	

	@Override 
	public List viewAllHouOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllHouOutware");
		return outwareList;
	}
	
	@Override 
	public List viewAllProOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllProOutware");
		return outwareList;
	}
	
	@Override 
	public List viewAllOutOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllOutOutware");
		return outwareList;
	}
	
	@Override 
	public List viewAllHouWorOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllHouWorOutware");
		return outwareList;
	}
	
	@Override 
	public List viewAllProWorOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllProWorOutware");
		return outwareList;
	}
	
	@Override 
	public List viewAllOutWorOutware() throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectAllOutWorOutware");
		return outwareList;
	}
	
	@Override 
	public List viewSelectedHouOutware(String search) throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectOneHouOutware", search);
		return outwareList;
	}
	
	@Override 
	public List viewSelectedProOutware(String search) throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectOneProOutware", search);
		return outwareList;
	}
	
	@Override 
	public List viewSelectedOutOutware(String search) throws DataAccessException {
		List<SystemmagVOMJ> outwareList = null;
		outwareList = sqlSession.selectList("mappers.erp.selectOneOutOutware", search);
		return outwareList;
	}
	
	
	@Override
	public List viewAllLogistics() throws DataAccessException {
		List<SystemmagVOMJ> logisticsList = null;
		logisticsList = sqlSession.selectList("mappers.erp.selectAllLogisticsManagement");
		return logisticsList;
	}
	
	@Override
	public List viewSelectedLogistics(String com_code) throws DataAccessException {
		List<SystemmagVOMJ> logisticsList = null;
		logisticsList = sqlSession.selectList("mappers.erp.selectOneLogisticsManagement", com_code);
		return logisticsList;
	}
	
	@Override
	public int insertNewLogistics (SystemmagVOMJ systemmagVO) throws DataAccessException{
		int result = sqlSession.insert("mappers.erp.insertNewLogisticsManagement",systemmagVO);
		return result;
	}

	@Override
	public void deleteLogistics(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteLogisticsManagement", obj);	
		}	
	}

	@Override
	public void updateLogistics(SystemmagVOMJ systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateLogisticsManagement", systemmagVO);
	}
	
	@Override
	public List<SystemmagVOMJ> viewsearchPopLogisticsName(String itemName) {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopLogisticsList",itemName);
		return popList;
	}

	@Override
	public List<SystemmagVOMJ> searchPopOutwareName(String itemName) throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.searchPopOutwareName",itemName);
		return popList;
	}
	

	@Override
	public List viewAllInspection() throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectAllInspection");
		return comList;
	}

	@Override
	public List viewInspection(String com_code) throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectOneInspection",com_code);
		return comList;
	}

	@Override
	public int insertNewInspection(SystemmagVOMJ systemmagVO) throws DataAccessException {
		int result = sqlSession.insert("mappers.erp.insertNewInspection",systemmagVO);
		return result;
	}

	@Override
	public void deleteInspection(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteInspection", obj);	
		}	
	}

	@Override
	public void updateInspection(SystemmagVOMJ systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateInspection", systemmagVO);
	}

	
	@Override
	public List viewAllSetComponents() throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectAllSetComponents");
		return comList;
	}
	
	@Override
	public List viewAllSpecComponents() throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectAllSpecComponents");
		return comList;
	}

	@Override
	public List viewSetComponents(String com_code) throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectOneSetComponents",com_code);
		return comList;
	}

	@Override
	public int insertNewSetComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		int result = sqlSession.insert("mappers.erp.insertNewSetComponents",systemmagVO);
		return result;
	}

	@Override
	public void deleteSetComponents(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteSetComponents", obj);	
		}
	}

	@Override
	public void updateSetComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateSetComponents", systemmagVO);
	}

	@Override
	public List<SystemmagVOMJ> viewsearchPopSetName(String itemName) throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopSetList",itemName);
		return popList;
	}

	@Override
	public List<SystemmagVOMJ> viewsearchPopComponentsName(String itemName) throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopComponentsList",itemName);
		return popList;
	}
	
	@Override
	public List<SystemmagVOMJ> viewsearchPopCompoItemName() throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectitemList");
		return popList;
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopCompoItemNameAjax(String itemName) throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.searchPopCompoItemNameAjax",itemName);
		return popList;
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopSpecItemNameAjax(String itemName) throws DataAccessException {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopSpecList",itemName);
		return popList;
	}
	//----------
	@Override
	public List viewSpecComponents(String com_code) throws DataAccessException {
		List<SystemmagVOMJ> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectOneSpecComponents",com_code);
		return comList;
	}

	@Override
	public int insertNewSpecComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		int result = sqlSession.insert("mappers.erp.insertNewSubSpecComponents",systemmagVO);
		return result;
	}

	@Override
	public void deleteSpecComponents(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteSpecComponents", obj);	
		}
	}

	@Override
	public void updateSpecComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateSpecComponents", systemmagVO);
		
	}
	
	
	

	

}
