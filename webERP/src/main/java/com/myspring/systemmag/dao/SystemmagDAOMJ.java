package com.myspring.systemmag.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.systemmag.vo.SystemmagVOMJ;

public interface SystemmagDAOMJ {

	public List viewAllCustomer() throws DataAccessException;
	
	public List viewCustomer(String com_code) throws DataAccessException;
	
	public int insertNewCustomer (SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List searchCustomer(String customerCode) throws DataAccessException;
	
	public void deleteCustomer(String[] noary) throws DataAccessException;
	
	public void updateCustomer(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List zipViewCustomer() throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopZipCodeName(String itemName) throws DataAccessException;
	

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
	
	public int insertNewLogistics (SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public void deleteLogistics(String[] noary) throws DataAccessException;
	
	public void updateLogistics(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopLogisticsName(String itemName) throws DataAccessException;

	public List<SystemmagVOMJ> searchPopOutwareName(String itemName) throws DataAccessException;
	

	public List viewAllInspection() throws DataAccessException;
	
	public List viewInspection(String com_code) throws DataAccessException;
	
	public int insertNewInspection (SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public void deleteInspection(String[] noary) throws DataAccessException;
	
	public void updateInspection(SystemmagVOMJ systemmagVO) throws DataAccessException;
	

	public List viewAllSetComponents() throws DataAccessException;
	
	public List viewAllSpecComponents() throws DataAccessException;
	
	public List viewSetComponents(String com_code) throws DataAccessException;
	
	public int insertNewSetComponents (SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public void deleteSetComponents(String[] noary) throws DataAccessException;
	
	public void updateSetComponents(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopSetName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopComponentsName(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> viewsearchPopCompoItemName() throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopCompoItemNameAjax(String itemName) throws DataAccessException;
	
	public List<SystemmagVOMJ> searchPopSpecItemNameAjax(String itemName) throws DataAccessException;
	
	

	public List viewSpecComponents(String com_code) throws DataAccessException;
	
	public int insertNewSpecComponents (SystemmagVOMJ systemmagVO) throws DataAccessException;
	
	public void deleteSpecComponents(String[] noary) throws DataAccessException;
	
	public void updateSpecComponents(SystemmagVOMJ systemmagVO) throws DataAccessException;
	
}
