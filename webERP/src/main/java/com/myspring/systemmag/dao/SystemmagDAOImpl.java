package com.myspring.systemmag.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.systemmag.vo.DepartmentVO;
import com.myspring.systemmag.vo.EmployeeVO;
import com.myspring.systemmag.vo.ItemgVO;
import com.myspring.systemmag.vo.SectorVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.WorkplaceVO;
import com.myspring.systemmag.vo.ZipcodeVO;
import com.myspring.systemmag.vo.itemVO;

@Repository("SystemmagDAO")
public class SystemmagDAOImpl implements SystemmagDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	//ȸ����
	@Override
	public int addCom(SystemmagVO systemmagVO) throws DataAccessException{
		int result = sqlSession.insert("mappers.erp.insertCom",systemmagVO);
		return 0;
	}
	
	//ȸ���� ��ȸ
	@Override
	public List viewCom() throws DataAccessException {
		List<SystemmagVO> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectcomList");
		System.out.println("comList: "+comList);
		return comList;
	}
	@Override
	public List allviewCom(String com_code) throws DataAccessException {
		List<SystemmagVO> comList = null;
		comList = sqlSession.selectList("mappers.erp.selectAllcomList",com_code);
		System.out.println("comList12: "+com_code);
		return comList;
	}
	//ȸ����(����)
	@Override
	public void updateCom(SystemmagVO systemmagVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updatecompany", systemmagVO);
	}
	//ȸ����(����)
	@Override
	public void deleteCom(String[] noary) throws DataAccessException {
		for(int i = 0;i<noary.length;i++) {
			sqlSession.delete("mappers.erp.deletecompany",noary[i]);	
		}
		
	}
	//ȸ����(�˾�)
		@Override
		public List viewZip() throws DataAccessException {
			List<SystemmagVO> zipList = null;
			zipList = sqlSession.selectList("mappers.erp.selectZipList");
			return zipList;
		}
		@Override
		public List zipText(String zipNumber) throws DataAccessException {
			List<ZipcodeVO> textList = null;
			textList = sqlSession.selectList("mappers.erp.selectzip",zipNumber);
			return textList;
		}
	//�������
		@Override
		public int addWor(WorkplaceVO workplaceVO) throws DataAccessException{
			int result = sqlSession.insert("mappers.erp.insertWor",workplaceVO);
			return 0;
		}
	//������� ��ȸ
	@Override
	public List viewWor() throws DataAccessException {
		List<WorkplaceVO> worList = null;
		worList = sqlSession.selectList("mappers.erp.selectworList");
		System.out.println("worList: "+worList);
		return worList;
	}
	@Override
	public List allviewWor(String wor_code) throws DataAccessException {
		List<WorkplaceVO> worList = null;
		worList = sqlSession.selectList("mappers.erp.selectAllworList",wor_code);
		System.out.println("worList12: "+wor_code);
		return worList;
	}
	//������� (����)
	@Override
	public void updateWor(WorkplaceVO workplaceVO) throws DataAccessException {
		sqlSession.update("mappers.erp.updateworkplace", workplaceVO);
	}
	@Override
	public void deleteWor(String[] noary) throws DataAccessException {
		for(int i = 0;i<noary.length;i++) {
			sqlSession.delete("mappers.erp.deleteWor",noary[i]);	
		}
		
	}
	//ǰ����(��ȸ)
	@Override
	public List viewItem() throws DataAccessException {
		List<itemVO> itemList = null;
		itemList = sqlSession.selectList("mappers.erp.selectRegitemList");
		System.out.println("worList: "+itemList);
		return itemList;
	}
	@Override
	public List allviewItem(String item_code) throws DataAccessException {
		List<itemVO> itemList = null;
		itemList = sqlSession.selectList("mappers.erp.selectAllRegitemList",item_code);
		return itemList;
	}
	//ǰ��(������ȸ)
	@Override
	public List SearchItemg(String itemNumber) throws DataAccessException{
		System.out.println(itemNumber);
		List<itemVO> searchList = null;
		searchList = sqlSession.selectList("mappers.erp.searchitemg",itemNumber);
		return searchList;
	}
	//ǰ����(�˾�)
	@Override
	public List viewItg() throws DataAccessException {
		List<ItemgVO> itgList = null;
		itgList = sqlSession.selectList("mappers.erp.selectAllitemgList");
		return itgList;
	}
	//ǰ����
		@Override
		public int addItem(itemVO itemVO) throws DataAccessException{
			int result = sqlSession.insert("mappers.erp.insertItem",itemVO);
			if(itemVO.getDivision().equals("부품") ||itemVO.getDivision().equals("반제품") ) {
				int result1 = sqlSession.insert("mappers.erp.insertPartItem",itemVO);
			}
			else if(itemVO.getDivision().equals("완제품")) {
				int result1 = sqlSession.insert("mappers.erp.insertProductItem",itemVO);
			}
			return 0;
		}
	//ǰ����(����)
		@Override
		public void updateItem(itemVO itemVO) throws DataAccessException {
			sqlSession.update("mappers.erp.updateItem", itemVO);
		}
	//ǰ����(����)
		@Override
		public void deleteItem(String[] noary) throws DataAccessException {
			for(int i = 0;i<noary.length;i++) {
				sqlSession.delete("mappers.erp.deleteItem",noary[i]);	
			}
			
		}
	//ǰ�񱺵��(��ȸ)
	@Override
	public List allviewItemg() throws DataAccessException {
		List<ItemgVO> itemgList = null;
		itemgList = sqlSession.selectList("mappers.erp.selectAllitemgList");
		System.out.println("itemList123: ");
		return itemgList;
	}
	//ǰ�񱺵��
			@Override
			public int addItemg(ItemgVO itemgVO) throws DataAccessException{
				int idx = itemgVO.getListVO().size()-1;
				int result = sqlSession.insert("mappers.erp.insertItemg",itemgVO.getListVO().get(idx));
				return 0;
			}
	//ǰ�񱺵��(����)
			@Override
			public void updateItemg(ItemgVO itemgVO) throws DataAccessException {
				int result = 0;
				for(int i = 0; i<itemgVO.getListVO().size();i++) {
				result = sqlSession.update("mappers.erp.updateitemg", itemgVO.getListVO().get(i));
				}
			}
	//ǰ�񱺵��(����)
			@Override
			public void deleteItemg(String[] noary) throws DataAccessException {
				for(int i = 0;i<noary.length;i++) {
					sqlSession.delete("mappers.erp.deleteItemg",noary[i]);	
				}
				
			}
	//�����ȸ
	@Override
	public List allviewemployee() throws DataAccessException {
		List<EmployeeVO> employeeList = null;
		employeeList = sqlSession.selectList("mappers.erp.selectAllemployeeList");
		System.out.println("employeeList123: ");
		return employeeList;
	}
	//�μ���� (��ȸ)
		@Override
		public List allviewdepartment() throws DataAccessException {
			List<DepartmentVO> departmentList = null;
			departmentList = sqlSession.selectList("mappers.erp.selectAlldepartmentList");
			System.out.println("departmentList123: ");
			return departmentList;
		}
	//�μ����
		@Override
		public int addDep(DepartmentVO departmentVO) throws DataAccessException{
			int idx = departmentVO.getListVO().size()-1;
			int result = sqlSession.insert("mappers.erp.insertDep",departmentVO.getListVO().get(idx));
			return 0;
		}
	//�μ����(����)
		@Override
		public void updateDep(DepartmentVO departmentVO) throws DataAccessException {
			int result = 0;
			for(int i = 0; i<departmentVO.getListVO().size();i++) {
			result = sqlSession.update("mappers.erp.updatedepartment", departmentVO.getListVO().get(i));
			}
		}
	//�μ����(����)
		@Override
		public void deleteDep(String[] noary) throws DataAccessException {
			for(int i = 0;i<noary.length;i++) {
				sqlSession.delete("mappers.erp.deleteDep",noary[i]);	
			}
			
		}
	//�μ����(�˾�)
		@Override
		public List viewDep() throws DataAccessException {
			List<DepartmentVO> depList = null;
			depList = sqlSession.selectList("mappers.erp.selectworList");
			return depList;
		}
	//�μ����(�˾�)
		@Override
		public List viewSec() throws DataAccessException {
			List<SectorVO> secList = null;
			secList = sqlSession.selectList("mappers.erp.selectSector");
			return secList;
		}

		@Override
		public List<ItemgVO> viewserachPopName(String itemName) {
			List<ItemgVO> popList = null;
			popList = sqlSession.selectList("mappers.erp.selectPopitemList",itemName);
			return popList;
		}
}
