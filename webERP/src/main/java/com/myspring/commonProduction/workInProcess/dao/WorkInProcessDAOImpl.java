package com.myspring.commonProduction.workInProcess.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.commonProduction.workInProcess.vo.WorkInProcessVO;



@Repository("WorkInProcessDAO")
public class WorkInProcessDAOImpl implements WorkInProcessDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override	
	public List WorkInProcess() throws DataAccessException {
		List<WorkInProcessVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectAllWorkInProcess");
		return popList;
	}
	
	@Override	
	public List WorkInProcessCondition(String itemCode) throws DataAccessException {
		List<WorkInProcessVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectAllWorkInProcessCondition", itemCode);
		return popList;
	}
}
