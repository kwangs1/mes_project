package com.myspring.systemmag.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.systemmag.dao.SystemmagDAOMJ;
import com.myspring.systemmag.vo.SystemmagVOMJ;

@Service("SystemmagServiceMJ")
@Transactional(propagation=Propagation.REQUIRED)
public class SystemmagServiceMJImpl implements SystemmagServiceMJ {
	@Autowired
	private SystemmagDAOMJ systemmagDAO;
	
	@Override
	public int addCustomer (SystemmagVOMJ systemmagVO) throws Exception{
		int result = systemmagDAO.insertNewCustomer(systemmagVO);
		return result;
    }
	
	@Override
	public List viewAllCustomer() throws DataAccessException {
		List comList = null;
		comList = systemmagDAO.viewAllCustomer();
		return comList;
	}
	
	@Override
	public List viewCustomer(String com_code) throws DataAccessException {
		List comList = systemmagDAO.viewCustomer(com_code);
		return comList;
	}

	@Override
	public void delCustomer(String[] noary) throws DataAccessException {
		systemmagDAO.deleteCustomer(noary);
	}

	@Override
	public void updCustomer(SystemmagVOMJ systemmagVO) throws DataAccessException {		
		systemmagDAO.updateCustomer(systemmagVO);
	}

	@Override
	public List zipViewCustomer() throws DataAccessException {
		return systemmagDAO.zipViewCustomer();
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopCustomerName(String itemName) {
		return systemmagDAO.viewsearchPopName(itemName);
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopZipCodeName(String itemName) {
		return systemmagDAO.viewsearchPopZipCodeName(itemName);
	}

	
	@Override
	public List viewAllHouOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllHouOutware();	
		return outwareList;
	}
	
	@Override
	public List viewAllProOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllProOutware();	
		return outwareList;
	}
	
	@Override
	public List viewAllOutOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllOutOutware();	
		return outwareList;
	}
	
	@Override
	public List viewAllHouWorOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllHouWorOutware();	
		return outwareList;
	}
	
	@Override
	public List viewAllProWorOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllProWorOutware();	
		return outwareList;
	}
	
	@Override
	public List viewAllOutWorOutware() throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewAllOutWorOutware();	
		return outwareList;
	}
	
	@Override
	public List viewSelectedHouOutware(String search) throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewSelectedHouOutware(search);	
		return outwareList;
	}
	
	@Override
	public List viewSelectedProOutware(String search) throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewSelectedProOutware(search);	
		return outwareList;
	}
	
	@Override
	public List viewSelectedOutOutware(String search) throws DataAccessException {
		List outwareList = null;
		outwareList = systemmagDAO.viewSelectedOutOutware(search);	
		return outwareList;
	}
	
	@Override
	public List viewAllLogistics() throws DataAccessException {
		List logisticsList = null;
		logisticsList = systemmagDAO.viewAllLogistics();
		return logisticsList;
	}
	
	@Override
	public List viewSelectedLogistics(String com_code) throws DataAccessException {
		List logisticsList = null;
		logisticsList = systemmagDAO.viewSelectedLogistics(com_code);
		return logisticsList;
	}
	
	@Override
	public int addLogistics (SystemmagVOMJ systemmagVO) throws Exception{
		int result = systemmagDAO.insertNewLogistics(systemmagVO);
		return result;
    }

	@Override
	public void deleteLogistics(String[] noary) throws DataAccessException {
		systemmagDAO.deleteLogistics(noary);
	}

	@Override
	public void updateLogistics(SystemmagVOMJ systemmagVO) throws DataAccessException {		
		systemmagDAO.updateLogistics(systemmagVO);
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopLogisticsName(String itemName) {
		return systemmagDAO.viewsearchPopLogisticsName(itemName);
	}

	@Override
	public List<SystemmagVOMJ> searchPopOutwareName(String itemName) throws DataAccessException {
		return systemmagDAO.searchPopOutwareName(itemName);
	}
	
	@Override
	public List viewAllInspection() throws DataAccessException {
		List comList = null;
		comList = systemmagDAO.viewAllInspection();
		return comList;
	}

	@Override
	public List viewInspection(String com_code) throws DataAccessException {
		List comList = systemmagDAO.viewInspection(com_code);
		return comList;
	}

	@Override
	public int addInspection(SystemmagVOMJ systemmagVO) throws Exception{
		int result = systemmagDAO.insertNewInspection(systemmagVO);
		return result;
    }

	@Override
	public void delInspection(String[] noary) throws DataAccessException {
		systemmagDAO.deleteInspection(noary);
	}

	@Override
	public void updInspection(SystemmagVOMJ systemmagVO) throws DataAccessException {		
		systemmagDAO.updateInspection(systemmagVO);
	}

	@Override
	public List viewAllSetComponents() throws DataAccessException {
		List comList = null;
		comList = systemmagDAO.viewAllSetComponents();
		return comList;
	}
	
	@Override
	public List viewAllSpecComponents() throws DataAccessException {
		List comList = null;
		comList = systemmagDAO.viewAllSpecComponents();
		return comList;
	}

	@Override
	public List viewSetComponents(String com_code) throws DataAccessException {
		List comList = systemmagDAO.viewSetComponents(com_code);
		return comList;
	}

	@Override
	public int addSetComponents(SystemmagVOMJ systemmagVO) throws Exception {
		int result = systemmagDAO.insertNewSetComponents(systemmagVO);
		return result;
	}

	@Override
	public void delSetComponents(String[] noary) throws DataAccessException {
		systemmagDAO.deleteSetComponents(noary);
		
	}

	@Override
	public void updSetComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		systemmagDAO.updateSetComponents(systemmagVO);
		
	}
	
	
	@Override
	public List viewSpecComponents(String com_code) throws DataAccessException {
		List comList = systemmagDAO.viewSpecComponents(com_code);
		return comList;
	}

	@Override
	public int addSpecComponents(SystemmagVOMJ systemmagVO) throws Exception {
		int result = systemmagDAO.insertNewSpecComponents(systemmagVO);
		return result;
	}

	@Override
	public void delSpecComponents(String[] noary) throws DataAccessException {
		systemmagDAO.deleteSpecComponents(noary);
		
	}

	@Override
	public void updSpecComponents(SystemmagVOMJ systemmagVO) throws DataAccessException {
		systemmagDAO.updateSpecComponents(systemmagVO);
		
	}
	
	//AJAX
	@Override
	public List<SystemmagVOMJ> searchPopSetName(String itemName) throws DataAccessException {
		return systemmagDAO.viewsearchPopSetName(itemName);
	}

	@Override
	public List<SystemmagVOMJ> searchPopComponentsName(String itemName) throws DataAccessException {
		return systemmagDAO.viewsearchPopComponentsName(itemName);
	}

	@Override
	public List<SystemmagVOMJ> searchPopCompoItemName() throws DataAccessException {
		return systemmagDAO.viewsearchPopCompoItemName();
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopCompoItemNameAjax(String itemName) throws DataAccessException {
		return systemmagDAO.searchPopCompoItemNameAjax(itemName);
	}
	
	@Override
	public List<SystemmagVOMJ> searchPopSpecItemNameAjax(String itemName) throws DataAccessException {
		return systemmagDAO.searchPopSpecItemNameAjax(itemName);
	}
}