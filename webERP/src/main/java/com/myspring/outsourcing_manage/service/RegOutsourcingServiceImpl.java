package com.myspring.outsourcing_manage.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.outsourcing_manage.ComOutsourcing.dao.ComOutsourcingDAO;
import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;
import com.myspring.outsourcing_manage.OutRelease.dao.OutReleaseDAO;
import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;
import com.myspring.outsourcing_manage.RegOutPerformance.dao.RegOutPerformanceDAO;
import com.myspring.outsourcing_manage.RegOutsourcing.dao.RegOutsourcingDAO;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

@Service("RegOutsourcingService")
@Transactional(propagation = Propagation.REQUIRED)
public class RegOutsourcingServiceImpl implements RegOutsourcingService {
	@Autowired
	private RegOutsourcingDAO regOutsourcingDAO;
	@Autowired
	private ComOutsourcingDAO comOutsourcingDAO;
	@Autowired
	private OutReleaseDAO outReleaseDAO;
	@Autowired
	private RegOutPerformanceDAO regOutPerformanceDAO;
	
	
	@Override
	public List listOutsourcing() throws DataAccessException{
		List outsourcingList = null;
		outsourcingList = regOutsourcingDAO.viewOutsourcingList();
		return outsourcingList;
	}
	
	@Override
	public List listComOutsourcing() throws DataAccessException{
		List comOutsourcingView = null;
		comOutsourcingView = comOutsourcingDAO.viewComOutsourcingList();
		return comOutsourcingView;
	}
	
	@Override
	public List listComOutsourcingDetail() throws DataAccessException{
		List comOutsourcingViewDetail = null;
		comOutsourcingViewDetail = comOutsourcingDAO.viewComOutsourcingListDetail();
		return comOutsourcingViewDetail;
	}
	
	@Override
	public List listOutRelease() throws DataAccessException{
		List outReleaseList = null;
		outReleaseList = outReleaseDAO.viewOutReleaseList();
		return outReleaseList;
	}
	
	@Override
	public List listOutReleaseDetail() throws DataAccessException{
		List outReleaseListDetail = null;
		outReleaseListDetail = outReleaseDAO.viewOutReleaseListDetail();
		return outReleaseListDetail;
	}
	
	@Override
	public List listRegOutPerformance() throws DataAccessException{
		List regOutPerformanceList = null;
		regOutPerformanceList = regOutPerformanceDAO.viewRegOutPerformanceList();
		return regOutPerformanceList;
	}
	
	@Override
	public List listRegOutPerformanceDetail() throws DataAccessException{
		List regOutPerformanceListDetail = null;
		regOutPerformanceListDetail = regOutPerformanceDAO.viewRegOutPerformanceListDetail();
		return regOutPerformanceListDetail;
	}
	
	@Override
	public int updateComOutsourcing(ComOutsourcingVO comOutsourcingVO) throws DataAccessException{
		return comOutsourcingDAO.updateComOutsourcing(comOutsourcingVO);
	}

	@Override
	 public int addOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException{
		return regOutsourcingDAO.insertOutsourcing(regOutsourcingVO);
	}
	
	@Override
	 public int addOutRelease(OutReleaseVO outReleaseVO) throws DataAccessException{
		return outReleaseDAO.insertOutRelease(outReleaseVO);
	}

	@Override
	 public int addOutReleaseDetail(OutReleaseVO outReleaseVO) throws DataAccessException{
		return outReleaseDAO.insertOutReleaseDetail(outReleaseVO);
	}

	@Override
	public void removeOutsourcing(String[] noary) throws DataAccessException{
		regOutsourcingDAO.deleteOutsourcing(noary);
	}
	
	@Override
	public int updateOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException{
		return regOutsourcingDAO.updateOutsourcing(regOutsourcingVO);
	}

	@Override
	public List productionPlanView(String startDate, String endDate) throws ParseException {
		  List popList = null;
		  popList = regOutsourcingDAO.productionPlanPop(startDate, endDate);
		  return popList;
	}
	
	
	
	
}
