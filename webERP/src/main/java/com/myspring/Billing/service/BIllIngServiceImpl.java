package com.myspring.Billing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.myspring.Billing.dao.BIllIngDAO;
import com.myspring.Billing.vo.BIllIngVO;
import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.Requiredamount.vo.RequiredamountVO;

@Service("billingService")
@Transactional(propagation = Propagation.REQUIRED)
public class BIllIngServiceImpl implements BIllIngService{
	@Autowired
	private BIllIngDAO billingDAO;
	
	@Override
	public List<BIllIngVO>selectAllcmList(String startDate, String endDate) throws Exception{
		List<BIllIngVO>cmList = billingDAO.selectAllcmList(startDate,endDate);
		return cmList;
	}	
	@Override
	public List<RequiredamountVO>selectAllMrpaMount()throws Exception{
		List<RequiredamountVO>mrpamount = billingDAO.selectAllMrpaMount();
		return mrpamount;
	}
	@Override
	public void delbilling(String[] noary) throws DataAccessException{
		billingDAO.delbilling(noary);
	}
	@Override
	public int updatebilling(BIllIngVO vo) throws DataAccessException {
		return billingDAO.updatebilling(vo);
	}
	@Override
	public int addbilling(BIllIngVO vo) throws DataAccessException {
		return billingDAO.addbilling(vo);
	}
}
