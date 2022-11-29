package com.myspring.systemmag.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.systemmag.vo.DepartmentVO;
import com.myspring.systemmag.vo.ItemgVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.WorkplaceVO;
import com.myspring.systemmag.vo.itemVO;

public interface SystemmagDAO {
	//회사등록
	public int addCom(SystemmagVO systemmagVO) throws DataAccessException;
	public List viewCom() throws DataAccessException;
	public List allviewCom(String com_code) throws DataAccessException;
	public void updateCom(SystemmagVO systemmagVO) throws DataAccessException;
	public void deleteCom(String[] noary) throws DataAccessException;
	//팝업
	public List viewZip() throws DataAccessException;
	public List zipText(String zipNumber) throws DataAccessException;
	public List viewItg() throws DataAccessException;
	public List viewDep() throws DataAccessException;
	public List viewSec() throws DataAccessException;
	//사업장등록
	public int addWor(WorkplaceVO workplaceVO) throws DataAccessException;
	public List viewWor() throws DataAccessException;
	public List allviewWor(String wor_code) throws DataAccessException;
	public void updateWor(WorkplaceVO workplaceVO) throws DataAccessException;
	public void deleteWor(String[] noary) throws DataAccessException;
	//품목등록
	public int addItem(itemVO itemVO) throws DataAccessException;
	public List viewItem() throws DataAccessException;
	public List allviewItem(String item_code) throws DataAccessException;
	public void updateItem(itemVO itemVO) throws DataAccessException;
	public void deleteItem(String[] noary) throws DataAccessException;
	public List SearchItemg(String itemNumber) throws DataAccessException;
	//품목군등록
	public int addItemg(ItemgVO itemgVO) throws DataAccessException;
	public List allviewItemg() throws DataAccessException;
	public void updateItemg(ItemgVO itemgVO) throws DataAccessException;
	public void deleteItemg(String[] noary) throws DataAccessException;
	//사원조회
	public List allviewemployee() throws DataAccessException;
	//부서등록
	public List allviewdepartment() throws DataAccessException;
	public int addDep(DepartmentVO departmentVO) throws DataAccessException;
	public void updateDep(DepartmentVO departmentVO) throws DataAccessException;
	public void deleteDep(String[] noary) throws DataAccessException;
	public List<ItemgVO> viewserachPopName(String itemName);
}
