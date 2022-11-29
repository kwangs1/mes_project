package com.myspring.Billing.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.myspring.Billing.vo.BIllIngVO;
import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.Requiredamount.vo.RequiredamountVO;

@Repository("billingDAO")
public class BIllIngDAOImpl implements BIllIngDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllcmList(String startDate, String endDate) throws Exception {
		List<BIllIngVO> cmList = null;
		if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = new Date(sdf.parse(startDate).getTime());
			Date end = new Date(sdf.parse(endDate).getTime());
			System.out.println(start);
			MainPlanVO vo = new MainPlanVO();
			vo.setStartDate(start);
			vo.setEndDate(end);
			cmList = sqlSession.selectList("mappers.erp.selectAllcmList", vo);
		} else {
			cmList = sqlSession.selectList("mappers.erp.selectAllcmList");
		}
		return cmList;
	}
	@Override
	public List selectAllMrpaMount() throws Exception{
		List<RequiredamountVO>mrpamount = sqlSession.selectList("mappers.erp.selectAllMrpaMount");
		return mrpamount;
	}
	@Override
	public void delbilling(String[] noary) throws DataAccessException{
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.delbilling", Integer.parseInt(obj));		
		}
	}
	@Override
	public int updatebilling(BIllIngVO vo) throws DataAccessException {
		int result = 0; 

		int idx = vo.getListVO().size()-1;
		for(int i = 0; i<idx;i++) {
			System.out.println("i"+i);
		System.out.println("idx : "+idx);
		result = sqlSession.update("mappers.erp.updatebilling",vo.getListVO().get(i));
		}
		return result;
	}
	@Override
	public int addbilling(BIllIngVO vo) throws DataAccessException {
		int idx = vo.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertbilling",vo.getListVO().get(idx));
		return 0;
	}
}
