package com.myspring.invenBasicInfo.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;

public interface IupViewService {
	public List iupView() throws DataAccessException;
	public List popView1() throws DataAccessException;
	public List popView2() throws DataAccessException;
	public List setText(String itemNumber)throws DataAccessException;
	public List SearchView(String itemNumber) throws DataAccessException;
	public List itemSet() throws DataAccessException;
	public int addIup(iupVO iupVO) throws DataAccessException;
	public void delIup(String[] noary) throws DataAccessException;
	public int updateIup(iupVO iupVO) throws DataAccessException;
	public int inputNo() throws DataAccessException;
	public List<iupVO> searchPopName(String itemName) throws DataAccessException;
	public List<iupVO> searchPopName2(String itemName) throws DataAccessException;

}
