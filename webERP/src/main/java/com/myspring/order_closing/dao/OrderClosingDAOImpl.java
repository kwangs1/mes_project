package com.myspring.order_closing.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.MainPlan.MpsOS.vo.MpsOSVO;
import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.order_closing.vo.OrderClosingVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;
import com.myspring.systemmag.vo.itemVO;

@Repository("orderclosingDAO")
public class OrderClosingDAOImpl implements OrderClosingDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllClosingList(String startDate, String endDate) throws Exception{
		List<OrderClosingVO>ClosingList = null;
		if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = new Date(sdf.parse(startDate).getTime());
			Date end = new Date(sdf.parse(endDate).getTime());
			System.out.println(start);
			MainPlanVO vo = new MainPlanVO();
			vo.setStartDate(start);
			vo.setEndDate(end);
			ClosingList = sqlSession.selectList("mappers.erp.selectAllClosingList", vo);
		} else {
			ClosingList = sqlSession.selectList("mappers.erp.selectAllClosingList");
		}
		return ClosingList;
	}
	
	@Override
	public void updateOrderClosing(String[] noary) throws DataAccessException {
		for(String obj: noary) {
			sqlSession.update("mappers.erp.updateOrderClosing", Integer.parseInt(obj));		
		}
	}
	
	@Override
	public void delClosing(String[] noary) throws DataAccessException{
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.delClosing", Integer.parseInt(obj));		
		}
	}
	
	@Override
	public int addClosing(OrderClosingVO vo) throws DataAccessException {
		int idx = vo.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertClosing",vo.getListVO().get(idx));
		return 0;
	}
	@Override
	public int updateClosing(OrderClosingVO vo) throws DataAccessException {
		int result = 0; 

		int idx = vo.getListVO().size();
		for(int i = 0; i<idx;i++) {
			System.out.println("i"+i);
		System.out.println("idx : "+idx);
		result = sqlSession.update("mappers.erp.updateClosing",vo.getListVO().get(i));
		}
		return result;
	}
	
	@Override
	public List itemList() throws Exception{
		List<itemVO>itemList = null;
		itemList = sqlSession.selectList("mappers.erp.itemList");
		return itemList;
	}
	
	@Override
	public List<itemVO>NameSearch(String itemName) {
		List<itemVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.NameSearch",itemName);
		return popList;
	}
	
	@Override
	public List buyerList() throws Exception{
		List<SystemmagVOMJ>buyerList = null;
		buyerList = sqlSession.selectList("mappers.erp.buyerList");
		return buyerList;
	}

	@Override
	public List<SystemmagVOMJ>buyerSearch(String buyer) {
		List<SystemmagVOMJ> popList = null;
		popList = sqlSession.selectList("mappers.erp.buyerSearch",buyer);
		return popList;
	}

}
