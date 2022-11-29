package com.myspring.outsourcing_manage.RegOutPerformance.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.outsourcing_manage.RegOutPerformance.vo.RegOutPerformanceVO;

public interface RegOutPerformanceDAO {
	public List viewRegOutPerformanceList() throws DataAccessException;
	public List viewRegOutPerformanceListDetail() throws DataAccessException;
	public int insertRegOutPerformance(RegOutPerformanceVO regOutPerformanceVO);
	public int insertRegOutPerformanceDetail(RegOutPerformanceVO regOutPerformanceVO);

}
