package com.myspring.outsourcing_manage.RegOutPerformance.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;
import com.myspring.outsourcing_manage.RegOutPerformance.vo.RegOutPerformanceVO;

@Repository("RegOutPerformanceDAO")
public class RegOutPerformanceDAOImpl implements RegOutPerformanceDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewRegOutPerformanceList() throws DataAccessException {
		List<OutReleaseVO> outreleaseList = null;
		outreleaseList = sqlSession.selectList("mappers.erp.selectAllRegOutPerformanceList");
		return outreleaseList;
	}

	@Override
	public List viewRegOutPerformanceListDetail() throws DataAccessException {
		List<OutReleaseVO> outreleaseList = null;
		outreleaseList = sqlSession.selectList("mappers.erp.selectAllRegOutPerformanceDetail");
		return outreleaseList;
	}

	@Override
	public int insertRegOutPerformance(RegOutPerformanceVO regOutPerformanceVO) {
		int idx = regOutPerformanceVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertRegOutPerformance",regOutPerformanceVO.getListVO().get(idx));
		return result;
	}

	@Override
	public int insertRegOutPerformanceDetail(RegOutPerformanceVO regOutPerformanceVO) {
		int idx = regOutPerformanceVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertRegOutPerformanceDetail",regOutPerformanceVO.getListVO().get(idx));
		return result;
	}

}
