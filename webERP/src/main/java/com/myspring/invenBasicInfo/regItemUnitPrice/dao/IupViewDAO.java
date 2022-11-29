package com.myspring.invenBasicInfo.regItemUnitPrice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;

public interface IupViewDAO {
	public List viewIup() throws DataAccessException;
	public List viewPop1() throws DataAccessException;
	public List viewPop2() throws DataAccessException;
	public List setText(String itemNumber) throws DataAccessException;
	public List SearchView(String itemNumber) throws DataAccessException;
	public int addIup(iupVO iupVO) throws DataAccessException;
	public void delIup(String[] noary) throws DataAccessException;
	public int updIup(iupVO iupVO) throws DataAccessException;
	public int selNo() throws DataAccessException;
	public List iupChildView() throws DataAccessException;
	public List<iupVO> searchPopName(String itemName) throws DataAccessException;
	public List<iupVO> searchPopName2(String itemName) throws DataAccessException;

}
