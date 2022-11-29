package com.myspring.Login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.Login.vo.LoginVO;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List depView() throws DataAccessException {
		List<LoginVO> depList = null;
		depList = sqlSession.selectList("mappers.erp.selectDep");
		return depList;
	}

	@Override
	public List empView(String depCode) throws DataAccessException {
		List<LoginVO> empList = null;
		empList = sqlSession.selectList("mappers.erp.selectEmp",depCode);
		return empList;
	}

	@Override
	public LoginVO loginList(LoginVO vo) throws DataAccessException {
		LoginVO loginVO = null;
		loginVO = sqlSession.selectOne("mappers.erp.LoginCheck",vo);
		return loginVO;
	}
}
