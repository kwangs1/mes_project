package com.myspring.productionBaseInfo.regDefectiveType.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.productionBaseInfo.regDefectiveType.vo.DefectiveTypeVO;

public interface DefectiveTypeDAO {

	List viewDefective(String defGroupCode) throws DataAccessException;

	int addoutprice(DefectiveTypeVO defVO) throws DataAccessException;

	int updDefType(DefectiveTypeVO defVO) throws DataAccessException;

	List viewGroupList() throws DataAccessException;

	int deldefType(String[] numberary) throws DataAccessException;

	int addDefpop(DefectiveTypeVO defVO) throws DataAccessException;

	Object deldefPop(String[] numberary) throws DataAccessException;



}
