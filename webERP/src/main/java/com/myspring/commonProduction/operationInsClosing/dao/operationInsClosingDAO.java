package com.myspring.commonProduction.operationInsClosing.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.commonProduction.operationInsClosing.vo.OperationInsClosingVO;

public interface operationInsClosingDAO {
	public List viewPop() throws DataAccessException;
	public List departmentViewPop() throws DataAccessException;
	public List selectAllOperationInsClosingInfo(String startDate, String endDate) throws DataAccessException, ParseException;
	public List selectAllOperationInsClosingInfoDetail(String number) throws DataAccessException, ParseException;
	public List<String> closingDetail(String[] numberAry) throws DataAccessException;
	public List<String> closingCancleDetail(String[] numberAry) throws DataAccessException;

}
