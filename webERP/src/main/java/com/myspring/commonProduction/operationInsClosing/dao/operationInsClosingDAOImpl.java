package com.myspring.commonProduction.operationInsClosing.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;
import com.myspring.commonProduction.operationInsClosing.vo.OperationInsClosingVO;
import com.myspring.commonProduction.operationRegist.vo.DepartmentViewVO;
import com.myspring.commonProduction.operationRegist.vo.FactoryViewVO;

@Repository("operationInsClosingDAO")
public class operationInsClosingDAOImpl implements operationInsClosingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List viewPop() throws DataAccessException {
		List<FactoryViewVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectFactoryList");
		return popList;
	}
	
	@Override
	public List departmentViewPop() throws DataAccessException {
		List<DepartmentViewVO> popList = null;
		popList = sqlSession.selectList("mappers.erp.selectDepartmentList");
		return popList;
	}
	
//	작업지시마감처리 기능부
	@Override
	public List selectAllOperationInsClosingInfo(String startDate, String endDate) throws DataAccessException, ParseException {
		List<OperationInsClosingVO> infoList = null;
		
		if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = new Date(sdf.parse(startDate).getTime());
			Date end = new Date(sdf.parse(endDate).getTime());
			CommitOperationInstructionVO COIvo = new CommitOperationInstructionVO();
			COIvo.setStartDate(start);
			COIvo.setEndDate(end);
			infoList = sqlSession.selectList("mappers.erp.selectAllOperationInsClosingInfoCondition", COIvo);
		} else {
			infoList = sqlSession.selectList("mappers.erp.selectAllOperationInsClosingInfo");
		}
		
		return infoList;
	}

	
	@Override
	public List selectAllOperationInsClosingInfoDetail(String number) throws DataAccessException, ParseException {
		List<OperationInsClosingVO> infoList = null;		
		infoList = sqlSession.selectList("mappers.erp.selectAllOperationInsClosingDetail", number);
		return infoList;
	}
	
//	마감 버튼 기능부
	@Override
	public List<String> closingDetail(String[] numberAry) throws DataAccessException{
		List<String> message = new ArrayList();
		
		for(String obj: numberAry) {
			
			String check = sqlSession.selectOne("mappers.erp.checkClosingDetail", obj);
			System.out.println("마감 : "+check);
			if(check.equals("확정")) {
				sqlSession.update("mappers.erp.updClosingDetail", obj);
				message.add("업데이트 완료!");
			} else {
				message.add("계획,마감상태의 작업은 변경 할 수 없습니다!");
			}
		}
		return message;
	}
	
	//마감처리 취소 기능부
	@Override
	public List<String> closingCancleDetail(String[] numberAry) throws DataAccessException{
		List<String> message = new ArrayList();
		
		for(String obj: numberAry) {
			
			String check = sqlSession.selectOne("mappers.erp.checkClosingDetail", obj);
			System.out.println("마감취소 : "+check);
			if(check.equals("계획")) {
				message.add("이미 계획상태입니다!");
			} else if(check.equals("확정")) {
				message.add("확정된 작업은 수정할 수 없습니다!");
			} else {
				sqlSession.update("mappers.erp.updCancleClosingDetail", obj);
					message.add("업데이트 완료!");
				
			}
		}
		return message;
	}
}
