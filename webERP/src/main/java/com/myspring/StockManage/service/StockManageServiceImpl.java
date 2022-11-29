package com.myspring.StockManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.StockManage.dao.StockManageDAO;
import com.myspring.StockManage.vo.StockManageVO;

@Service("StockManageService")
public class StockManageServiceImpl implements StockManageService{
	
	@Autowired
	StockManageDAO stockManageDAO;

	@Override
	public List<StockManageVO> SearchStockAll() {
		return stockManageDAO.SearchStockAll();
	}

	@Override
	public List<StockManageVO> SearchfinishedStockAll() {
		return stockManageDAO.SearchfinishedStockAll();
	}

	@Override
	public List<StockManageVO> SearchStock(String type) { 
		List popList = null;
		popList = stockManageDAO.SearchStock(type);
		
		return popList;
	}

	@Override
	public List<StockManageVO> SearchfinishedStock(String name) {
		List popList = null;
		popList = stockManageDAO.SearchfinishedStock(name);
		
		return popList;
	}

	@Override
	public List nameView() {
		List popList = null;
		popList = stockManageDAO.nameView();
		
		return popList;
	}

	@Override
	public List<StockManageVO> searchPopName(String itemName) {
		return stockManageDAO.viewserachPopName(itemName);
	}

	@Override
	public List finishednameView() {
		List popList = null;
		popList = stockManageDAO.finishednameView();
		
		return popList;
	}

	@Override
	public List<StockManageVO> searchPopName2(String itemName) {
		return stockManageDAO.viewserachPopName2(itemName);
	}

	@Override
	public List cusView() {
		List popList = null;
		popList = stockManageDAO.cusView();
		
		return popList;
	}

	@Override
	public List<StockManageVO> searchPopCus(String itemName) {
		return stockManageDAO.viewserachPopCus(itemName);
	}

	@Override
	public List<StockManageVO> Searchsuju(String general_Customer_Code) {
		return stockManageDAO.Searchsuju(general_Customer_Code);
	}

	@Override
	public List<String> keywordSearch(String keyword) {
		List<String> list=stockManageDAO.selectKeywordSearch(keyword);
		return list;
	}

	@Override
	public String searchMenu(String searchWord) {
		String list=stockManageDAO.searchMenu(searchWord);
		return list;
	}

	@Override
	public List<StockManageVO> sujusub(String ordersNum) {
		return stockManageDAO.sujusub(ordersNum);
	}

	@Override
	public void delsuju(String[] numberary) {
		// TODO Auto-generated method stub
		stockManageDAO.delsuju(numberary);
	}

	@Override
	public void delsujuSub(String[] numberary) {
		// TODO Auto-generated method stub
		stockManageDAO.delsujuSub(numberary);
	}

	@Override
	public void insertNewRow(StockManageVO stVO) {
		// TODO Auto-generated method stub
		stockManageDAO.insertNewRow(stVO);
	}

	@Override
	public void updateSuju(StockManageVO stVO) {
		// TODO Auto-generated method stub
		stockManageDAO.updateSuju(stVO);
	}

	@Override
	public List searchitemList1() {
		List popList = null;
		popList = stockManageDAO.searchitemList1();
		return popList;
	}

	@Override
	public List<StockManageVO> searchPopItem(String itemName) {
		return stockManageDAO.searchPopItem(itemName);
	}





	

	
}
