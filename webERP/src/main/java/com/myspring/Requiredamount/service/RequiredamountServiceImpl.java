package com.myspring.Requiredamount.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.Requiredamount.dao.RequiredamountDAO;
import com.myspring.Requiredamount.vo.RequiredamountVO;
import com.myspring.order_closing.vo.OrderClosingVO;

@Service("mrpService")
@Transactional(propagation = Propagation.REQUIRED)
public class RequiredamountServiceImpl implements RequiredamountService{
	@Autowired
	private RequiredamountDAO mrpDAO;
	
	@Override
	public List<RequiredamountVO>selectAllMrpList(String startDate, String endDate) throws Exception{
		List<RequiredamountVO>mrpList = mrpDAO.selectAllMrpList(startDate,endDate);
		return mrpList;
	}

}
