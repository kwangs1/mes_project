package com.myspring.productionBaseInfo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.productionBaseInfo.BOM.vo.RegOutSourcingPriceVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.productionBaseInfo.regDefectiveType.vo.DefectiveTypeVO;

public interface BomViewService {
	public List bomView() throws DataAccessException;
	public List itemView1() throws DataAccessException;
	public List itemView2() throws DataAccessException;
	public List setText(String itemNumber)throws DataAccessException;
	public List SearchView(String itemNumber) throws DataAccessException;
	public List itemSet() throws DataAccessException;
	public int addBOM(bomVO bomVO) throws DataAccessException;
	public void delBOM(String[] noary) throws DataAccessException;
	public int inputNo() throws DataAccessException;
	public List SearchOutView() throws DataAccessException;
	public List SearchOutView1(String itemNumber) throws DataAccessException;
	public List getoutprice(String itemNumber, String placeCode) throws DataAccessException;
	public int addoutprice(RegOutSourcingPriceVO outVO) throws DataAccessException;
	public List inputText(String itemCode)throws DataAccessException;
	public int updoutprice(RegOutSourcingPriceVO outVO) throws DataAccessException;
	public List viewDefective(String defGroupCode) throws DataAccessException;
	public int addDefType(DefectiveTypeVO defVO) throws DataAccessException;
	public int updDefType(DefectiveTypeVO defVO) throws DataAccessException;
	public List viewGroupList() throws DataAccessException;
	public int deldefType(String[] numberary) throws DataAccessException;
	public int addDefpop(DefectiveTypeVO defVO) throws DataAccessException;
	public int doutprice(List<RegOutSourcingPriceVO> outVO1) throws DataAccessException;
	public void deldefPop(String[] numberary) throws DataAccessException;
	public List<bomVO> searchPopName(String itemName) throws DataAccessException;
	public List<bomVO> searchbomPop1(String itemName) throws DataAccessException;
	public List<bomVO> searchbomPop2(String itemName) throws DataAccessException;
	public List ResearveView(String number) throws DataAccessException;
	public int updateBOM(bomVO bomVO) throws DataAccessException;
}
