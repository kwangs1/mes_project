package com.myspring.salesmanage.forward.reg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.salesmanage.cor.vo.CorVO;
import com.myspring.salesmanage.forward.vo.ForwardVO;
import com.myspring.salesmanage.itemview.vo.ItemViewVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;

@Repository("forwardRegDAO")
public class ForwardRegDAOImpl implements ForwardRegDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//popCust
	@Override
	public List selectAllCustList() throws DataAccessException {
		List<SystemmagVOMJ> custList = null;
		custList = sqlSession.selectList("mappers.erp.allCustList");
		return custList;
	}//popRegForwardCust1 
	@Override
	public List selectAllItemList() throws DataAccessException {
		List<ItemViewVO> allItemList = null;
		allItemList = sqlSession.selectList("mappers.erp.selectAllItemList");
		return allItemList;
	}//pop2
	@Override
	public List selectSupForwardList() throws DataAccessException {
		List<ForwardVO> supForwardList = null;
		supForwardList = sqlSession.selectList("mappers.erp.allSupForward");
		return supForwardList;
	}//all superForward 
		
	@Override
	public List submitForwardCustSupReg(String general_Customer_Code) throws DataAccessException { 
		List<ForwardVO> submitCustList = null;
		submitCustList = sqlSession.selectList("mappers.erp.submitSupForward",general_Customer_Code);
		submitCustList.get(0).getDeadLine();
		return submitCustList;
	}//choice custCode by superForward
	@Override
	public void delSupForward(String[] forwardCodeary) throws DataAccessException {
		for(String relCode: forwardCodeary) {
			sqlSession.delete("mappers.erp.delSupforward",relCode);
			}
		
	}//delete super Forward  
	
	@Override
	public List submitForwardReg(String custCode) throws DataAccessException {
		List<ForwardVO> submitList = null;
		submitList = sqlSession.selectList("mappers.erp.submitCustForward",custCode);
		return submitList;
	}//choice custCode by insert  

	@Override
	public int updForward(ForwardVO forwardVO) throws DataAccessException {
		int result = 0; 
		int idx = forwardVO.getListVO().size();
		for(int i = 0; i<idx; i++) {
			result = sqlSession.update("mappers.erp.updateForward", forwardVO.getListVO().get(i));		
		}
		return result;
	}

	@Override
	public int addForward(ForwardVO forwardVO) throws DataAccessException {
		int idx = forwardVO.getListVO().size()-1;
		int result = sqlSession.insert("mappers.erp.insertSupForward",forwardVO.getListVO().get(idx));
		return 0;
	}
	@Override
	public List submitSubReg(String relCode) throws DataAccessException {
		List<CorVO> subForward = null;
		subForward = sqlSession.selectList("mappers.erp.submitItemForward",relCode);
			return subForward;
	}

	@Override
	public void delItemForward(String[] ItemCodeary) throws DataAccessException {
		for(String no: ItemCodeary) {
			sqlSession.delete("mappers.erp.delItemforward",no);
			}
	}
	@Override
	public int addItemForward(CorVO corVO) throws DataAccessException {
		int result = sqlSession.insert("mappers.erp.insertForwardItem",corVO);
		result = sqlSession.update("mappers.erp.updForwardQuantity", corVO);	
		return 0;
	}
	
	@Override
	public int updItemForward(CorVO corVO) throws DataAccessException {
		int result = sqlSession.insert("mappers.erp.updateSubForward",corVO);
		
		return 0;
	}
	
//	@Override
//	public void selectStockList(String[] itemCodeary) throws DataAccessException {
//				for(String item_code: itemCodeary) {
//				sqlSession.delete("mappers.erp.stockQuantity",item_code);
//				}
//	}
	@Override
	public List selectItemSub() throws DataAccessException {
		List<CorVO> subForwardItem = null;
		subForwardItem = sqlSession.selectList("mappers.erp.allItemForward");
			return subForwardItem;
	}
}

