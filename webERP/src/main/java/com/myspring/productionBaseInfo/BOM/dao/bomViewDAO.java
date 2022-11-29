package com.myspring.productionBaseInfo.BOM.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.productionBaseInfo.BOM.vo.RegOutSourcingPriceVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;

public interface bomViewDAO {
	public List viewBOM() throws DataAccessException;

	public List viewPop1() throws DataAccessException;
	public List viewPop2() throws DataAccessException;
	public List setText(String itemNumber) throws DataAccessException;
	public List SearchView(String itemNumber) throws DataAccessException;
	public int addBOM(bomVO bomVO) throws DataAccessException;
	public void delBOM(String[] noary) throws DataAccessException;
	public int updBOM(bomVO bomVO) throws DataAccessException;
	public int selNo() throws DataAccessException;


	public List SearchOutView() throws DataAccessException;

	public List searchOutView1(String itemNumber) throws DataAccessException;

	public List getoutprice(String itemNumber, String placeCode) throws DataAccessException;

	public int addoutprice(RegOutSourcingPriceVO outVO) throws DataAccessException;

	public List inputText(String itemCode)throws DataAccessException;

	public int updoutprice(RegOutSourcingPriceVO outVO)throws DataAccessException;

	public int deloutprice(List<RegOutSourcingPriceVO> outVO1) throws DataAccessException;

	public List<bomVO> searchoutPop(String itemName) throws DataAccessException;

	public List searchbomPop1(String itemName) throws DataAccessException;
	public List searchbomPop2(String itemName) throws DataAccessException;

	public List researveView(String number) throws DataAccessException;


	public int updateBOM(bomVO bomVO) throws DataAccessException;

}
