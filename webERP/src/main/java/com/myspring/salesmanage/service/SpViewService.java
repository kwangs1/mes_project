package com.myspring.salesmanage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.invenBasicInfo.regItemUnitPrice.vo.iupVO;
import com.myspring.salesmanage.salesplan.vo.spVO;

public interface SpViewService {
	public List spView() throws DataAccessException;
	public List popView1() throws DataAccessException;
	public List popView2() throws DataAccessException;
	public List setText(String itemCode)throws DataAccessException;
	public List SearchView(String itemCode) throws DataAccessException;
	public List itemSet() throws DataAccessException;
	public int addSp(spVO spVO) throws DataAccessException;
	public void delSp(String[] itemCodeary) throws DataAccessException;
	public int updateSp(spVO spVO) throws DataAccessException;
	public List<spVO> searchPopName(String itemName) throws DataAccessException;
	public List<spVO> searchPopName2(String itemName) throws DataAccessException;
}
