package com.myspring.MainPlan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.MainPlan.MpsOS.vo.MpsOSVO;
import com.myspring.MainPlan.dao.MainPlanDAO;
import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;

@Service("mainplanService")
@Transactional(propagation = Propagation.REQUIRED)
public class MainPlanServiceImpl implements MainPlanService{
	@Autowired
	private MainPlanDAO mainplanDAO;

	@Override
	public List viewMPS() throws Exception {
		List MPSView = null;
		MPSView = mainplanDAO.viewMPS();
		return MPSView;
	}
	
	@Override
	public List<MpsOSVO>selectAllMpsosList()throws Exception{
		List<MpsOSVO>mpsosList = mainplanDAO.selectAllMpsosList();
		return mpsosList;
	}
	
	@Override
	public void delMps(String[] noary) throws DataAccessException{
		mainplanDAO.delMps(noary);
	}

	
	@Override
	public int addMPS(MainPlanVO vo) throws DataAccessException {
		return mainplanDAO.addMPS(vo);
	}
		  
	@Override
	public int updateMPS(MainPlanVO vo) throws DataAccessException {
		return mainplanDAO.updateMPS(vo);
	}
	
	@Override
	public List<MpsOSVO> searchMPSOS(String itemName) {
		return mainplanDAO.searchMPSOS(itemName);
	}
	
	@Override
	public int inputSeq() throws DataAccessException {
		return mainplanDAO.selSeq();
	}
	@Override
	public List setText(String itemNumber) throws DataAccessException {
		List searchList = null;
		searchList = mainplanDAO.setText(itemNumber);
		return searchList;
	}

	@Override
	public List SearchView(String itemNumber) throws DataAccessException {
		List searchList = null;
		searchList = mainplanDAO.SearchView(itemNumber);
		return searchList;
	}

	@Override
	public List inputText(String itemCode) throws DataAccessException {
		List searchList = null;
		searchList = mainplanDAO.inputText(itemCode);
		return searchList;
	}
	
	@Override
	public List<SystemmagVOMJ>Listbuyer()throws Exception{
		List<SystemmagVOMJ>Listbuyer = mainplanDAO.Listbuyer();
		return Listbuyer;
	}
	@Override
	public List<SystemmagVOMJ> Searchbuyer(String buyer) {
		return mainplanDAO.Searchbuyer(buyer);
	}

}
