package com.myspring.businessStatus.releaseStatus.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.businessStatus.releaseStatus.vo.*;

@Repository("rsViewDAO")
public class RsViewDAOImpl implements RsViewDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List viewRs() throws DataAccessException {
		List<rsVO> rsList = null;
		rsList = sqlSession.selectList("mappers.erp.rsSelectAllMemberList");
		return rsList;
	}
	@Override
	public List searchView(String startDate, String endDate) throws DataAccessException,ParseException{
		List<rsVO> searchList = null;
		if(startDate != null && startDate != "" && endDate != null && endDate != "") {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = new Date(sdf.parse(startDate).getTime());
		Date end = new Date(sdf.parse(endDate).getTime());
		rsVO rsVO = new rsVO();
		rsVO.setStartDate(start);
		rsVO.setEndDate(end);
		searchList = sqlSession.selectList("mappers.erp.rsSearchItem",rsVO);
		}
		return searchList;
	}
}
