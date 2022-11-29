package com.myspring.commonProduction.commitOperationInstruction.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;

public interface CommitOperationInstructionDAO {
	public List selectAllProductionPlanInfo(String itemNumber,String startDate, String endDate) throws DataAccessException, ParseException;
	public List itemCodeViewPop() throws DataAccessException;
	public void delProductionPlan(String[] numberAry) throws DataAccessException;
	public int addProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException;
	public int updProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException;
	public List checkStock(String itemCode) throws DataAccessException;
	public int minValue(String itemCode) throws DataAccessException;

}
