package com.myspring.outsourcing_manage.RegOutsourcing.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

@Repository("RegOutsourcingDAO")
public class RegOutsourcingDAOImpl implements RegOutsourcingDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewOutsourcingList() throws DataAccessException {
		List<RegOutsourcingVO> outsourcingList = null;
		outsourcingList = sqlSession.selectList("mappers.erp.selectAllOutsourcingList");
		return outsourcingList;
	}

	@Override
	public int insertOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException {
		int idx = regOutsourcingVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertOutsourcing",regOutsourcingVO.getListVO().get(idx));
		return 0;
	}

	@Override
	public void deleteOutsourcing(String[] noary) throws DataAccessException{
		for(String obj: noary) {
			sqlSession.delete("mappers.erp.deleteOutsourcing", obj);		
			System.out.println("DAO.deleteOutsourcing");
		}
	}
	
	@Override
	public int updateOutsourcing(RegOutsourcingVO regOutsourcingVO) throws DataAccessException {
		int result = 0; 

		int idx = regOutsourcingVO.getListVO().size()-1;
		for(int i = 0; i<idx;i++) {
			System.out.println("i"+i);
		System.out.println("idx : "+idx);
		result = sqlSession.update("mappers.erp.updateOutsourcing",regOutsourcingVO.getListVO().get(i));		
		System.out.println("DAOresult:"+result);
		//bomList.add(bomVO);
		//}
		}
		return result;
	}

	@Override
	public List productionPlanPop(String startDate, String endDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = new Date(sdf.parse(startDate).getTime());
		Date end = new Date(sdf.parse(endDate).getTime());
		CommitOperationInstructionVO COIvo = new CommitOperationInstructionVO();
		COIvo.setStartDate(start);
		COIvo.setEndDate(end);
		List<CommitOperationInstructionVO> COIList = null;
		COIList = sqlSession.selectList("mappers.erp.selectProductionPlanList", COIvo);
		return COIList;
	}

	
}
