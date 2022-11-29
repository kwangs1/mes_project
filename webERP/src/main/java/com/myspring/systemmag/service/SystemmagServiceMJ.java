package com.myspring.systemmag.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.systemmag.vo.SystemmagVOMJ;

public interface SystemmagServiceMJ {
	public List viewAllCustomer() throws DataAccessException;
	
	public List viewCustomer(String com_code) throws DataAccessException;
	
	public int addCustomer(SystemmagVOMJ systemmagVO) throws Exception;
	
	public void delCustomer(String[] noary) throws DataAccessException;
	
	public void updCustomer(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List zipViewCustomer() throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopCustomerName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopZipCodeName(String itemName) throws DataAccessException;
	

	public List viewAllHouOutware() throws DataAccessException;
	
	public List viewAllProOutware() throws DataAccessException;
	
	public List viewAllOutOutware() throws DataAccessException;
	
	public List viewAllHouWorOutware() throws DataAccessException;
	
	public List viewAllProWorOutware() throws DataAccessException;
	
	public List viewAllOutWorOutware() throws DataAccessException;
	
	public List viewSelectedHouOutware(String search) throws DataAccessException;
	
	public List viewSelectedProOutware(String search) throws DataAccessException;
	
	public List viewSelectedOutOutware(String search) throws DataAccessException;
	
	
	public List viewAllLogistics() throws DataAccessException;
	
	public List viewSelectedLogistics(String com_code) throws DataAccessException;
	
	public int addLogistics(SystemmagVOMJ systemmagVO) throws Exception;
	
	public void deleteLogistics(String[] noary) throws DataAccessException;
	
	public void updateLogistics(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopLogisticsName(String itemName) throws DataAccessException;

	public List<SystemmagVOMJ> searchPopOutwareName(String itemName) throws DataAccessException;
	

	public List viewAllInspection() throws DataAccessException;
	
	public List viewInspection(String com_code) throws DataAccessException;
	
	public int addInspection(SystemmagVOMJ systemmagVO) throws Exception;
	
	public void delInspection(String[] noary) throws DataAccessException;
	
	public void updInspection(SystemmagVOMJ systemmagVO) throws DataAccessException;

	
	public List viewAllSetComponents() throws DataAccessException;
	
	public List viewAllSpecComponents() throws DataAccessException;
	
	public List viewSetComponents(String com_code) throws DataAccessException;
	
	public int addSetComponents(SystemmagVOMJ systemmagVO) throws Exception;
	
	public void delSetComponents(String[] noary) throws DataAccessException;
	
	public void updSetComponents(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopSetName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopComponentsName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopCompoItemName() throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopCompoItemNameAjax(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopSpecItemNameAjax(String itemName) throws DataAccessException;
	

	public List viewSpecComponents(String com_code) throws DataAccessException;
	
	public int addSpecComponents(SystemmagVOMJ systemmagVO) throws Exception;
	
	public void delSpecComponents(String[] noary) throws DataAccessException;
	
	public void updSpecComponents(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	
	
}
