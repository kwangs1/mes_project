package com.myspring.commonProduction.commitOperationInstruction.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;
import com.myspring.commonProduction.operationRegist.vo.DepartmentViewVO;
import com.myspring.commonProduction.operationRegist.vo.OperationRegistVO;

@Repository("CommitOperationInstructionDAO")
public class CommitOperationInstructionDAOImpl implements CommitOperationInstructionDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllProductionPlanInfo(String itemCode,String startDate, String endDate) throws DataAccessException, ParseException {
		List<OperationRegistVO> infoList = null;
		 
		if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String item = itemCode;
		Date start = new Date(sdf.parse(startDate).getTime());
		Date end = new Date(sdf.parse(endDate).getTime());
		System.out.println(start);
		CommitOperationInstructionVO COIvo = new CommitOperationInstructionVO();
		COIvo.setStartDate(start);
		COIvo.setEndDate(end);
		COIvo.setItemCode(item);
		infoList = sqlSession.selectList("mappers.erp.selectAllProductionPlanInfoCondition", COIvo);
		} else {
			infoList = sqlSession.selectList("mappers.erp.selectAllProductionPlanInfo", itemCode);
		}
		return infoList;
	}
	
	@Override
	public List itemCodeViewPop() throws DataAccessException {
		List<DepartmentViewVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectItemCodeView");
		return popList;
	}
	
	@Override
	public int addProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException {
		int idx = COIVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertProductionPlan",COIVO.getListVO().get(idx));
		return 0;
	}
	
	@Override
	public int updProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException {
		int result = 0; 
		int idx = COIVO.getListVO().size()-1;
		for(int i = 0; i<idx;i++) {
			System.out.println("i"+i);
		System.out.println("idx : "+idx);
		result = sqlSession.update("mappers.erp.updateProductionPlan",COIVO.getListVO().get(i));		
		System.out.println("DAOresult:"+result);
		//bomList.add(bomVO);
		//}
		}
		return result;
	}
	
	@Override
	public void delProductionPlan(String[] numberAry) throws DataAccessException{
		for(String obj: numberAry) {
			sqlSession.delete("mappers.erp.deleteProductionPlan", obj);	
		}
	}
	
	@Override
	public List checkStock(String itemCode) throws DataAccessException {
		List<CommitOperationInstructionVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.checkStockView", itemCode);
		return popList;
	}
	
	@Override
	public int minValue(String itemCode) throws DataAccessException {
		List<CommitOperationInstructionVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.checkStockQuantity", itemCode);
		int minValue = popList.get(0).getQuantity();
		return minValue;
	}
}
