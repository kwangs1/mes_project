package com.myspring.outsourcing_manage.OutRelease.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;

@Repository("OutReleaseDAO")
public class OutReleaseDAOImpl implements OutReleaseDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewOutReleaseList() throws DataAccessException {
		List<OutReleaseVO> outreleaseList = null;
		outreleaseList = sqlSession.selectList("mappers.erp.selectAllOutReleaseList");
		return outreleaseList;
	}

	@Override
	public List viewOutReleaseListDetail() throws DataAccessException {
		List<OutReleaseVO> outreleaseList = null;
		outreleaseList = sqlSession.selectList("mappers.erp.selectAllOutReleaseListDetail");
		return outreleaseList;
	}

	@Override
	public int insertOutRelease(OutReleaseVO outReleaseVO) {
		int idx = outReleaseVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertOutRelease",outReleaseVO.getListVO().get(idx));
		return result;
	}

	@Override
	public int insertOutReleaseDetail(OutReleaseVO outReleaseVO) {
		int idx = outReleaseVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertOutReleaseDetail",outReleaseVO.getListVO().get(idx));
		return result;
	}

	
}
