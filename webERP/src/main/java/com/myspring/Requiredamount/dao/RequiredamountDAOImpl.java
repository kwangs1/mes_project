package com.myspring.Requiredamount.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.Requiredamount.vo.RequiredamountVO;
import com.myspring.order_closing.vo.OrderClosingVO;

@Repository("mrpDAO")
public class RequiredamountDAOImpl implements RequiredamountDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllMrpList(String startDate, String endDate) throws Exception{
		List<RequiredamountVO>mrpList = null;
		if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = new Date(sdf.parse(startDate).getTime());
			Date end = new Date(sdf.parse(endDate).getTime());
			System.out.println(start);
			MainPlanVO vo = new MainPlanVO();
			vo.setStartDate(start);
			vo.setEndDate(end);
			mrpList = sqlSession.selectList("mappers.erp.selectAllMrpList", vo);
		} else {
			mrpList = sqlSession.selectList("mappers.erp.selectAllMrpList");
		}
		return mrpList;
}

}
