package com.myspring.Billing.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import com.myspring.Billing.vo.BIllIngVO;

public interface BIllIngDAO {

	List selectAllMrpaMount() throws Exception;

	void delbilling(String[] noary) throws DataAccessException;

	int updatebilling(BIllIngVO vo) throws DataAccessException;

	int addbilling(BIllIngVO vo) throws DataAccessException;

	List selectAllcmList(String startDate, String endDate) throws Exception;

}
