package com.myspring.StockManage.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;


@Repository("StockManageDAO")
public class StockManageDAOImpl implements StockManageDAO {
	
	@Autowired
	SqlSession sqlSession;
	private Object serachVO;

	@Override
	public List<StockManageVO> SearchStock(String name) throws DataAccessException {
		// TODO Auto-generated method stub
		List<StockManageVO> stockList = null;
		stockList = sqlSession.selectList("mappers.erp.stockView", name);
		return stockList;
	}

	@Override
	public List<StockManageVO> SearchStockAll() {
		List<StockManageVO> stockList = null;
		stockList = sqlSession.selectList("mappers.erp.stockViewAll");
		return stockList;
	}

	@Override
	public List<StockManageVO> SearchfinishedStockAll() {
		List<StockManageVO> stockList = null;
		stockList = sqlSession.selectList("mappers.erp.finishedstockViewAll");
		return stockList;
	}

	@Override
	public List SearchfinishedStock(String name) {
		List<StockManageVO> stockList = null;
		stockList = sqlSession.selectList("mappers.erp.finishedstockView", name);
		return stockList;
	}

	@Override
	public List nameView() {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectstockList");
		return nameList;
	}

	@Override
	public List<StockManageVO> viewserachPopName(String itemName) {
		List<StockManageVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopstockList",itemName);
		return popList;
	}

	@Override
	public List finishednameView() {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectfinishedstockList");
		return nameList;
	}

	@Override
	public List<StockManageVO> viewserachPopName2(String itemName) {
		List<StockManageVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopstockList2",itemName);
		return popList;
	}

	@Override
	public List cusView() {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectcusList");
		return nameList;
	}

	@Override
	public List<StockManageVO> viewserachPopCus(String itemName) {
		List<StockManageVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopCusList",itemName);
		return popList;
	}

	@Override
	public List<StockManageVO> Searchsuju(String general_Customer_Code) {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectsujuList",general_Customer_Code);
		return nameList;
	}

	@Override
	public List<String> selectKeywordSearch(String keyword) {
		 List<String> list=(ArrayList)sqlSession.selectList("mappers.erp.selectKeywordSearch",keyword);
		 return list;
	}

	@Override
	public String searchMenu(String searchWord) {
		String urlList = null;
		urlList = sqlSession.selectOne("mappers.erp.searchMenu", searchWord);
		return urlList;
	}

	@Override
	public List<StockManageVO> sujusub(String ordersNum) {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectsujusub",ordersNum);
		return nameList;
	}

	@Override
	public void delsuju(String[] numberary) {
		// TODO Auto-generated method stub
		for(String obj: numberary) {
			sqlSession.delete("mappers.erp.delsuju",obj);
		}
	}

	@Override
	public void delsujuSub(String[] numberary) {
		for(String obj: numberary) {
			sqlSession.delete("mappers.erp.delsujuSub",obj);
		}
	}

	@Override
	public void insertNewRow(StockManageVO stVO) {
		// TODO Auto-generated method stub
		int idx= stVO.getSujuVO().size()-1;
		if(StringUtils.hasText(stVO.getSujuVO().get(idx).getTax())){
			sqlSession.insert("mappers.erp.insertSujuRow",stVO.getSujuVO().get(idx));
		}
		if(stVO.getSubSujuList() != null) {
			for(int i = 0 ; i<stVO.getSubSujuList().size(); i++) {
				stVO.getSubSujuList().get(i).setBusCode(stVO.getBusCode());
				stVO.getSubSujuList().get(i).setCode(stVO.getInsertNo());
				sqlSession.insert("mappers.erp.insertSujuRowSub",stVO.getSubSujuList().get(i));
			}
		}    
		
	}

	@Override
	public void updateSuju(StockManageVO stVO) {
		// TODO Auto-generated method stub
//		int idx= stVO.getStoVO().size()-1;
//		if(StringUtils.hasText(stVO.getStoVO().get(idx).getGeneral_Customer_Code())){
		if(stVO.getStoVO() != null) {
			for(int i = 0 ; i<stVO.getStoVO().size(); i++) {
			sqlSession.update("mappers.erp.updateSujuRow",stVO.getStoVO().get(i));
			}
		}
		if(stVO.getSubListStoVO() != null) {
			for(int i = 0 ; i<stVO.getSubListStoVO().size(); i++) {
				sqlSession.update("mappers.erp.updateSujuRowSub",stVO.getSubListStoVO().get(i));
			}
		}   
	}

	@Override
	public List searchitemList1() {
		List<StockManageVO> nameList = null;
		nameList = sqlSession.selectList("mappers.erp.selectItemList");
		return nameList;
	}

	@Override
	public List<StockManageVO> searchPopItem(String itemName) {
		List<StockManageVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopItemList",itemName);
		return popList;
	}



	


}
