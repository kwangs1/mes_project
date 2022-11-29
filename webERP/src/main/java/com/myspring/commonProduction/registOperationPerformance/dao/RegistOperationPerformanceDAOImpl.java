package com.myspring.commonProduction.registOperationPerformance.dao;

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
import com.myspring.commonProduction.operationRegist.vo.DepartmentViewVO;
import com.myspring.commonProduction.operationRegist.vo.FactoryViewVO;
import com.myspring.commonProduction.registOperationPerformance.vo.HouseCodeSearchVO;
import com.myspring.commonProduction.registOperationPerformance.vo.PerformanceQuantityVO;
import com.myspring.commonProduction.registOperationPerformance.vo.ProcessCodeSearchVO;
import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceDetailVO;
import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceVO;
import com.myspring.commonProduction.registOperationPerformance.vo.WorkplaceCodeSearchVO;

@Repository("RegistOperationPerformanceDAO")
public class RegistOperationPerformanceDAOImpl implements RegistOperationPerformanceDAO {
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
   
//   작업실적등록 기능부
   @Override
   public List selectAllRegistOperationPerformanceInfo(String startDate, String endDate) throws DataAccessException, ParseException {
      List<RegistOperationPerformanceVO> infoList = null;
      infoList = sqlSession.selectList("mappers.erp.selectAllRegistOperationPerformanceInfoCondition");
      
//      if(startDate != null && startDate !=  "" && endDate != null && endDate != "") {
//         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//         Date start = new Date(sdf.parse(startDate).getTime());
//         Date end = new Date(sdf.parse(endDate).getTime());
//         CommitOperationInstructionVO COIvo = new CommitOperationInstructionVO();
//         COIvo.setStartDate(start);
//         COIvo.setEndDate(end);
//         infoList = sqlSession.selectList("mappers.erp.selectAllRegistOperationPerformanceInfoCondition", COIvo);
//      } else {
//         infoList = sqlSession.selectList("mappers.erp.selectAllRegistOperationPerformanceInfo");
//      }
      
      return infoList;
   }

   
   @Override
   public List selectAllRegistOperationPerformanceInfoDetail(String number) throws DataAccessException, ParseException {
      List<RegistOperationPerformanceDetailVO> infoList = null;      
      infoList = sqlSession.selectList("mappers.erp.selectAllRegistOperationPerformanceInfoDetail", number);
      return infoList;
   }
   
   @Override
   public int addRegistOperationPerformanceInfoDetail(RegistOperationPerformanceDetailVO ROPDVO) throws DataAccessException {
      int idx = ROPDVO.getDetailVO().size()-1;
      int result = sqlSession.insert("mappers.erp.insertRegistOperationPerformanceInfoDetail",ROPDVO.getDetailVO().get(idx));
      return result;
   }
   
//   자재사용 버튼 기능부
   @Override
   public List<String> MaterialUse(String[] numberAry) throws DataAccessException{
      List<String> message = new ArrayList();
      List<PerformanceQuantityVO> list = new ArrayList<PerformanceQuantityVO>();
      
      for(String obj: numberAry) {
         
         String check = sqlSession.selectOne("mappers.erp.checkMaterialUse", obj);
         System.out.println("자재사용 : "+check);
         if(check.equals("무")) {
            sqlSession.update("mappers.erp.updMaterialUse", obj);
            list = sqlSession.selectList("mappers.erp.selectperformanceQuantity", obj);
            if(list.get(0).getDivision().equals("완제품")) {
            	sqlSession.update("mappers.erp.updAddFinalStock", list.get(0));
            }else {
            	sqlSession.update("mappers.erp.updAddStock", list.get(0));            	
            }
            message.add("업데이트 완료!");
            
         } else {
            message.add("이미 변경되었습니다!");
         }
      }
      return message;
   }

   // 팝업부 기능구현
   
   @Override
   public List houseCodeViewPop() throws DataAccessException {
      List<HouseCodeSearchVO> popList = null;
      popList = sqlSession.selectList("mappers.erp.selectHouseCodeList");
      return popList;
   }

   @Override
   public List processCodeViewPop() throws DataAccessException {
      List<ProcessCodeSearchVO> popList = null;
      popList = sqlSession.selectList("mappers.erp.selectProcessCodeList");
      return popList;
   }
   
   @Override
   public List workplaceCodeViewPop() throws DataAccessException {
      List<WorkplaceCodeSearchVO> popList = null;
      popList = sqlSession.selectList("mappers.erp.selectWorkplaceCodeList");
      return popList;
   }

   @Override
   public void deleteRegistOperationPerformanceInfoDetail(String[] numberAry) {
       for(String obj: numberAry) {
            String check = sqlSession.selectOne("mappers.erp.checkMaterialUse", obj);
            if(check.equals("무")) {
               sqlSession.delete("mappers.erp.deleteRegistOperationPerformanceInfoDetail", obj);
            } else {
               System.out.println("자재출고된 정보는 삭제할 수 없습니다.");
               continue;
            }
         }
      
   }
}
