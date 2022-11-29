package com.myspring.salesmanage.salesplan.dao;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.salesmanage.itemview.vo.ItemViewVO;

@Repository("salesplanDAO")
public class SalesplanDAOImpl implements SalesplanDAO{

		@Autowired
		private SqlSession sqlSession;
		
		List<ItemViewVO> itemList;


		@Override
		public List selectAllSalesplanList() throws DataAccessException {
			List<ItemViewVO> salesplansList = null;
			salesplansList = sqlSession.selectList("mappers.erp.selectAllSalesplanList");
			//mapper.salesplan
			return salesplansList;
		}//selectAllMemberList

		@Override
		public List selectAllItemList() throws DataAccessException {
			List<ItemViewVO> allItemList = null;
			allItemList = sqlSession.selectList("mappers.erp.selectAllItemList");
			System.out.println("확인2");
			return allItemList;
		}//selectPopList
		
		@Override
		public List submitItemView(String item_code) throws DataAccessException {
			List<ItemViewVO> searchItemList = null;
			searchItemList = sqlSession.selectList("mappers.erp.submititemview",item_code);
			return searchItemList;
		}//submit를 누르면 table에 들어감
		

}


