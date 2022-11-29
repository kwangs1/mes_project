package com.myspring.outsourcing_manage.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;
import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

public interface RegOutsourcingService {
	public List listOutsourcing() throws DataAccessException;
	public int addOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException;
	public void removeOutsourcing(String[] noary) throws DataAccessException;
	public int updateOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException;
	public List productionPlanView(String startDate, String endDate) throws ParseException;
	public List listComOutsourcing() throws DataAccessException;
	public List listComOutsourcingDetail() throws DataAccessException;
	public int updateComOutsourcing(ComOutsourcingVO comOutsourcingVO) throws DataAccessException;
	public List listOutRelease() throws DataAccessException;
	public List listOutReleaseDetail() throws DataAccessException;
	public int addOutRelease(OutReleaseVO outReleaseVO) throws DataAccessException;
	public int addOutReleaseDetail(OutReleaseVO outReleaseVO) throws DataAccessException;
	public List listRegOutPerformance() throws DataAccessException;
	public List listRegOutPerformanceDetail() throws DataAccessException;
}
