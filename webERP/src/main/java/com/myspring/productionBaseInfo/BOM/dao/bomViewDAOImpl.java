package com.myspring.productionBaseInfo.BOM.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.productionBaseInfo.BOM.vo.RegOutSourcingPriceVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.productionBaseInfo.service.BomViewService;

@Repository("bomViewDAO")
public class bomViewDAOImpl implements bomViewDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewBOM() throws DataAccessException {
		List<bomVO> bomList = null;
		bomList = sqlSession.selectList("mappers.erp.selectAllMemberList");
		return bomList;
	}

	@Override
	public List viewPop1() throws DataAccessException {
		List<bomVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopList1");
		return popList;
	}
	@Override
	public List viewPop2() throws DataAccessException {
		List<bomVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopList2");
		return popList;
	}

	@Override
	public List setText(String itemNumber) throws DataAccessException {
		List<bomVO> textList = null;
		textList = sqlSession.selectList("mappers.erp.selectitem",itemNumber);
		return textList;
	}
	@Override
	public List SearchView(String itemNumber) throws DataAccessException{
		List<bomVO> searchList = null;
		searchList = sqlSession.selectList("mappers.erp.searchitem",itemNumber);
		return searchList;
	}

	@Override
	public int addBOM(bomVO bomVO) throws DataAccessException {
		int idx = bomVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertBOM",bomVO.getListVO().get(idx));
		return 0;
	}
	
	@Override
	public void delBOM(String[] noary) throws DataAccessException{
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteBOM", Integer.parseInt(obj));		
		}
	}


	@Override
	public int updBOM(bomVO bomVO) throws DataAccessException {
		int result = 0; 

		int idx = bomVO.getListVO().size();
		for(int i = 0; i<idx;i++) {
		result = sqlSession.update("mappers.erp.updateBOM",bomVO.getListVO().get(i));		
		}
		return result;
	}

	@Override
	public int selNo() throws DataAccessException {
		return sqlSession.selectOne("mappers.erp.selectNo");
	}


	@Override
	public List SearchOutView() throws DataAccessException {
		List<bomVO> outList = null;
		outList = sqlSession.selectList("mappers.erp.outView");
		return outList;
	}

	@Override
	public List searchOutView1(String itemNumber) throws DataAccessException {
		List<bomVO> outList1 = null;
		outList1 = sqlSession.selectList("mappers.erp.outViewex");
		return outList1;
	}

	@Override
	public List getoutprice(String itemNumber,String placeCode) throws DataAccessException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("0", itemNumber);
		map.put("1", placeCode);
		List<bomVO> outpriceView = null;
		outpriceView = sqlSession.selectList("mappers.erp.outpriceView",map);
		System.out.println(map.get("1") + outpriceView.size());
		return outpriceView;
	}

	@Override
	public int addoutprice(RegOutSourcingPriceVO outVO) throws DataAccessException {
		int result = 0;
		int idx = outVO.getOutpriveVO().size()-1;
			result = sqlSession.update("mappers.erp.addoutprice",outVO.getOutpriveVO().get(idx));	
		return result;
	}
	@Override
	public int updateBOM(bomVO bomVO) throws DataAccessException {
		int result = sqlSession.update("mappers.erp.updateBOM",bomVO);
		return 0;
	}

	@Override
	public List inputText(String itemCode) throws DataAccessException {
		List<bomVO> textList = null;
		textList = sqlSession.selectList("mappers.erp.selectoutitem",itemCode);
		return textList;
	}

	@Override
	public int updoutprice(RegOutSourcingPriceVO outVO) throws DataAccessException {
		int result = 0; 
		int idx = outVO.getOutpriveVO().size();
		for(int i = 0; i<idx;i++) {
		result = sqlSession.update("mappers.erp.udpoutprice",outVO.getOutpriveVO().get(i));		
		}
		return result;
	}


	@Override
	public int deloutprice(List<RegOutSourcingPriceVO> outVO1) throws DataAccessException {
		int result = 0; 
		for(int i = 0;i<outVO1.size();i++) {
			result = sqlSession.update("mappers.erp.deloutprice",outVO1.get(i));
			System.out.println("반복" + i);
		}
		return result;
	}

	@Override
	public List<bomVO> searchoutPop(String itemName) throws DataAccessException {
		List<bomVO> outList1 = null;
		outList1 = sqlSession.selectList("mappers.erp.outPopSearch",itemName);
		return outList1;
	}

	@Override
	public List searchbomPop1(String itemName) throws DataAccessException {
		List<bomVO> outList1 = null;
		outList1 = sqlSession.selectList("mappers.erp.bomPopSearch1",itemName);
		return outList1;
	}

	@Override
	public List searchbomPop2(String itemName) throws DataAccessException {
		List<bomVO> outList1 = null;
		outList1 = sqlSession.selectList("mappers.erp.bomPopSearch2",itemName);
		return outList1;
	}

	@Override
	public List researveView(String number) throws DataAccessException {
		List<bomVO> bomList = null;
		bomList = sqlSession.selectList("mappers.erp.researveView",number);
		System.out.println(bomList.size());
		return bomList;
	}


}
