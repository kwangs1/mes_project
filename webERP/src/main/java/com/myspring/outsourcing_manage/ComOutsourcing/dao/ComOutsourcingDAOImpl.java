package com.myspring.outsourcing_manage.ComOutsourcing.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;

@Repository("ComOutsourcingDAO")
public class ComOutsourcingDAOImpl implements ComOutsourcingDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List viewComOutsourcingList() throws DataAccessException {
		List<ComOutsourcingVO> outsourcingList = null;
		outsourcingList = sqlSession.selectList("mappers.erp.selectAllComOutsourcingList");
		return outsourcingList;
	}

	@Override
	public List viewComOutsourcingListDetail() throws DataAccessException {
		List<ComOutsourcingVO> outsourcingList = null;
		outsourcingList = sqlSession.selectList("mappers.erp.selectComOutsourcingListDetail");
		return outsourcingList;
	}

	
	@Override
	public int updateComOutsourcing(ComOutsourcingVO comOutsourcingVO) throws DataAccessException {
		int result = 0; 
		//String str = "W021060000"; 
		int idx = comOutsourcingVO.getListVO().size()-1;
		for(int i = 0; i<idx;i++) {
			
			System.out.println("i"+i);
		System.out.println("idx : "+idx);
		
			//if(str.concat(String.valueOf(i))==comOutsourcingVO.getListVO().get(i).getWorkOrderNumber()) {
				result = sqlSession.update("mappers.erp.updateComOutsourcing",comOutsourcingVO.getListVO().get(i));		
				System.out.println("DAOresult:"+result);
			//}
		}
		return result;
	}
}
