package com.myspring.outsourcing_manage.ComOutsourcing.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;

public interface ComOutsourcingDAO {
	public List viewComOutsourcingList() throws DataAccessException;
	public List viewComOutsourcingListDetail() throws DataAccessException;
	public int updateComOutsourcing(ComOutsourcingVO comOutsourcingVO) throws DataAccessException;
}
