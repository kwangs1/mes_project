package com.myspring.businessStatus.releaseStatus.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.businessStatus.releaseStatus.vo.*;

public interface RsViewDAO {
	public List viewRs() throws DataAccessException;
	public List searchView(String startDate, String endDate) throws DataAccessException,ParseException;
}
