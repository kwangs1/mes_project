package com.myspring.invenBasicInfo.regItemUnitPrice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;


@Repository("iupViewDAO")
public class IupViewDAOImpl implements IupViewDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewIup() throws DataAccessException {
		List<iupVO> iupList = null;
		iupList = sqlSession.selectList("mappers.erp.iupSelectAllMemberList");
		return iupList;
	}

	@Override
	public List viewPop1() throws DataAccessException {
		List<iupVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.iupSelectPopList1");
		return popList;
	}
	@Override
	public List viewPop2() throws DataAccessException {
		List<iupVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.iupSelectPopList2");
		return popList;
	}

	@Override
	public List setText(String itemNumber) throws DataAccessException {
		List<iupVO> textList = null;
		textList = sqlSession.selectList("mappers.erp.iupSelectItem1",itemNumber);
		return textList;
	}
	@Override
	public List SearchView(String itemNumber) throws DataAccessException{
		List<iupVO> searchList = null;
		searchList = sqlSession.selectList("mappers.erp.iupSearchItem",itemNumber);
		return searchList;
	}

	@Override
	public int addIup(iupVO iupVO) throws DataAccessException {
		int idx = iupVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertIup",iupVO.getListVO().get(idx));
		return 0;
	}
	
	@Override
	public void delIup(String[] noary) throws DataAccessException{
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteIup", Integer.parseInt(obj));		
			System.out.println("DAO.delIup");
		}
	}


	@Override
	public int updIup(iupVO iupVO) throws DataAccessException {
		int result = 0; 

		int idx = iupVO.getListVO().size();
		for(int i = 0; i<idx; i++) {
			System.out.println("i" + i);
		System.out.println("idx : " + idx);
		result = sqlSession.update("mappers.erp.updateIup", iupVO.getListVO().get(i));		
		System.out.println("DAOresult:"+result);
		}
		return result;
	}

	@Override
	public int selNo() throws DataAccessException {
		return sqlSession.selectOne("mappers.erp.iupSelectNo");
	}
	
	@Override
	public List iupChildView() throws DataAccessException {
		return sqlSession.selectList("mappers.erp.iupChildView");
	}

	@Override
	public List<iupVO> searchPopName(String itemName) throws DataAccessException {
		List<iupVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopiupList",itemName);
		return popList;
	}

	@Override
	public List<iupVO> searchPopName2(String itemName) throws DataAccessException {
		List<iupVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopiupList2",itemName);
		return popList;
	}
	

}
