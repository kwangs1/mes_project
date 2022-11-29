package com.myspring.commonProduction.operationRegist.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.commonProduction.operationRegist.vo.OperationDetailVO;
import com.myspring.commonProduction.operationRegist.vo.OperationRegistVO;

public interface OperationRegistDAO {
	public List selectAllOperationInfo(String startDate, String endDate) throws DataAccessException, ParseException;
	public List viewPop() throws DataAccessException;
	public List departmentViewPop() throws DataAccessException;
	public List productionPlanPop(String startDate, String endDate) throws DataAccessException, ParseException;
	public int addOperationInstruction(OperationRegistVO ORVO) throws DataAccessException;
	public void delOperationInstruction(String[] numberAry) throws DataAccessException;
	public int updOperationInstruction(OperationRegistVO ORVO) throws DataAccessException;
	public List selectAllCommitOperationInfo(String startDate, String endDate) throws DataAccessException, ParseException;
	public List selectAllCommitOperationInfoDetail(String number) throws DataAccessException, ParseException;
	public List<String> confirmDetail(String[] numberAry) throws DataAccessException;
	public List<String> revertDetail(String[] numberAry) throws DataAccessException;
	public List selectRelease(String number) throws DataAccessException, ParseException;
	public List selectReleaseDetail(String number) throws DataAccessException, ParseException;
	public int addReleaseData(OperationDetailVO ORVO) throws DataAccessException;
	public int delCommitOperation(OperationDetailVO ODVO) throws DataAccessException;
	public List facilityViewPop() throws DataAccessException;
		
}
