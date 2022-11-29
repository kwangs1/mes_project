package com.myspring.outsourcing_manage.OutRelease.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;

public interface OutReleaseDAO {
	List viewOutReleaseList() throws DataAccessException;
	List viewOutReleaseListDetail() throws DataAccessException;
	int insertOutRelease(OutReleaseVO outReleaseVO);
	int insertOutReleaseDetail(OutReleaseVO outReleaseVO);

}
