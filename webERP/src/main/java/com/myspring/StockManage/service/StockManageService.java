package com.myspring.StockManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.StockManage.dao.StockManageDAO;
import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;

public interface StockManageService {
	public static final StockManageDAO stockManageDAO = null;

	List<StockManageVO> SearchStockAll();

	List<StockManageVO> SearchfinishedStockAll();

	List<StockManageVO> SearchStock(String type);

	List<StockManageVO> SearchfinishedStock(String type);

	List nameView();

	List<StockManageVO> searchPopName(String itemName);

	List finishednameView();

	List<StockManageVO> searchPopName2(String itemName);

	List cusView();

	List<StockManageVO> searchPopCus(String itemName);

	List<StockManageVO> Searchsuju(String general_Customer_Code);

	List<String> keywordSearch(String keyword);

	String searchMenu(String searchWord);

	List<StockManageVO> sujusub(String ordersNum);

	void delsuju(String[] numberary);

	void delsujuSub(String[] numberary);

	void insertNewRow(StockManageVO stVO);

	void updateSuju(StockManageVO stVO);

	List searchitemList1();

	List<StockManageVO> searchPopItem(String itemName);







}
