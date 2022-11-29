package com.myspring.MainPlan.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.MainPlan.MpsOS.vo.MpsOSVO;
import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;

public interface MainPlanService {

	void delMps(String[] noary) throws DataAccessException;

	int addMPS(MainPlanVO vo) throws DataAccessException;

	int updateMPS(MainPlanVO vo) throws DataAccessException;

	List<MpsOSVO> searchMPSOS(String itemName);

	int inputSeq() throws DataAccessException;

	List setText(String itemNumber) throws DataAccessException;

	List SearchView(String itemNumber) throws DataAccessException;

	List inputText(String itemCode) throws DataAccessException;

	List<MpsOSVO> selectAllMpsosList() throws Exception;

	List viewMPS() throws Exception;

	List<SystemmagVOMJ> Listbuyer() throws Exception;

	List<SystemmagVOMJ> Searchbuyer(String buyer);

}
