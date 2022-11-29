package com.myspring.outsourcing_manage.RegOutsourcing.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

public interface RegOutsourcingDAO {
	 public List viewOutsourcingList() throws DataAccessException;
	 public int insertOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException ;
	 public void deleteOutsourcing(String[] noary) throws DataAccessException;
	 public int updateOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException;
	public List productionPlanPop(String startDate, String endDate) throws ParseException;
}
