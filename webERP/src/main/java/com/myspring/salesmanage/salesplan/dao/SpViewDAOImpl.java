package com.myspring.salesmanage.salesplan.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.invenBasicInfo.regItemUnitPrice.vo.iupVO;
import com.myspring.salesmanage.salesplan.vo.spVO;

@Repository("spViewDAO")
public class SpViewDAOImpl implements SpViewDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewSp() throws DataAccessException {
		List<spVO> spList = null;
		spList = sqlSession.selectList("mappers.erp.spSelectAllMemberList");
		return spList;
	}

	@Override
	public List viewPop1() throws DataAccessException {
		List<spVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.spSelectPopList1");
		return popList;
	}
	@Override
	public List viewPop2() throws DataAccessException {
		List<spVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.spSelectPopList2");
		return popList;
	}

	@Override
	public List setText(String itemCode) throws DataAccessException {
		List<spVO> textList = null;
		textList = sqlSession.selectList("mappers.erp.spSelectItem1",itemCode);
		return textList;
	}
	@Override
	public List SearchView(String itemCode) throws DataAccessException{
		List<spVO> searchList = null;
		searchList = sqlSession.selectList("mappers.erp.spSearchItem",itemCode);
		return searchList;
	}

	@Override
	public int addSp(spVO spVO) throws DataAccessException {
		int idx = spVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertSp",spVO.getListVO().get(idx));
		return 0;
	}
	
	@Override
	public void delSp(String[] itemCodeary) throws DataAccessException{
		for(String obj: itemCodeary) {
			sqlSession.delete("mappers.erp.deleteSp",obj);		
			System.out.println("DAO.delSp");
		}
	}

	@Override
	public int updSp(spVO spVO) throws DataAccessException {
		int result = 0; 

		int idx = spVO.getListVO().size();
		for(int i = 0; i<idx; i++) {
			System.out.println("i" + i);
		System.out.println("idx : " + idx);
		result = sqlSession.update("mappers.erp.updateSp", spVO.getListVO().get(i));		
		System.out.println("DAOresult:"+result);
		}
		return result;
	}

	@Override
	public List spChildView() throws DataAccessException {
		return sqlSession.selectList("mappers.erp.spChildView");
	}
	
	@Override
	public List<spVO> searchPopName(String itemName) throws DataAccessException {
		List<spVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopspList",itemName);
		return popList;
	}

	@Override
	public List<spVO> searchPopName2(String itemName) throws DataAccessException {
		List<spVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectPopspList2",itemName);
		return popList;
	}

}