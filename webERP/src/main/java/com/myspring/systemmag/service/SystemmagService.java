package com.myspring.systemmag.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.systemmag.vo.DepartmentVO;
import com.myspring.systemmag.vo.ItemgVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.WorkplaceVO;
import com.myspring.systemmag.vo.itemVO;

public interface SystemmagService {
	//회사등록
	public int addCom(SystemmagVO systemmagVO) throws Exception;
	public List comView() throws DataAccessException;
	public List comcom(String com_code) throws DataAccessException;
	public void updCom(SystemmagVO systemmagVO) throws DataAccessException;
	public void delCom(String[] noary) throws DataAccessException;
	//팝업
	public List zipView(String zipNumber) throws DataAccessException;
	public List zipText(String zipNumber) throws DataAccessException;
	public List itgView(String itgNumber) throws DataAccessException;
	public List depView(String depNumber) throws DataAccessException;
	public List secView(String secNumber) throws DataAccessException;
	//사업장등록
	public int addWor(WorkplaceVO workplaceVO) throws Exception;
	public List worView() throws DataAccessException;
	public List worcom(String wor_code) throws DataAccessException;
	public void updWor(WorkplaceVO workplaceVO) throws DataAccessException;
	public void delWor(String[] noary) throws DataAccessException;
	//품목등록
	public int addItem(itemVO itemVO) throws Exception;
	public List itemView() throws DataAccessException;
	public List comitem(String item_code) throws DataAccessException;
	public void updItem(itemVO itemVO) throws DataAccessException;
	public void delItem(String[] noary) throws DataAccessException;
	public List Searchitemg(String itemNumber) throws DataAccessException;
	//품목군등록
	public int addItemg(ItemgVO itemgVO) throws Exception;
	public List itemgView() throws DataAccessException;
	public void updItemg(ItemgVO itemgVO) throws DataAccessException;
	public void delItemg(String[] noary) throws DataAccessException;
	//사원조회
	public List employeeView() throws DataAccessException;
	//부서등록
	public int addDep(DepartmentVO departmentVO) throws Exception;
	public List departmentView() throws DataAccessException;
	public void updDep(DepartmentVO departmentVO) throws DataAccessException;
	public void delDep(String[] noary) throws DataAccessException;
	public List<ItemgVO> searchPopName(String itemName);
}
