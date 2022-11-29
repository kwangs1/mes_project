
 package com.myspring.commonProduction.service;
  
  import java.text.ParseException;
import java.util.List;
  
  import org.springframework.dao.DataAccessException;
  
  import com.myspring.commonProduction.commitOperationInstruction.vo.
  CommitOperationInstructionVO;
import com.myspring.commonProduction.operationInsClosing.vo.OperationInsClosingVO;
import com.myspring.commonProduction.operationRegist.vo.OperationDetailVO;
import
  com.myspring.commonProduction.operationRegist.vo.OperationRegistVO;
import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceDetailVO;
import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceVO;
  
  public interface CommonProductionService {
  
  public List selectAllProductionPlanInfo(String itemNumber, String startDate, String endDate) throws DataAccessException, ParseException; 
  public List<OperationRegistVO> selectAllOperationInfo(String startDate, String endDate) throws DataAccessException, ParseException;
  public List itemView() throws DataAccessException;
  public List departmentView() throws DataAccessException;
  public List productionPlanView(String startDate, String endDate) throws DataAccessException, ParseException;
  public int addOperationInstruction(OperationRegistVO ORVO) throws DataAccessException;
  public void delOperationInstruction(String[] numberAry) throws DataAccessException;
  public int updOperationInstruction(OperationRegistVO ORVO) throws DataAccessException;
  public List itemCodeSearch() throws DataAccessException;
  public void delProductionPlan(String[] numberAry) throws DataAccessException;
  public int addProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException;
  public int updProductionPlan(CommitOperationInstructionVO COIVO) throws DataAccessException;
  public List<OperationRegistVO> selectAllCommitOperationInfo(String startDate, String endDate) throws DataAccessException, ParseException;
  public List<OperationDetailVO> selectAllCommitOperationInfoDetail(String number) throws DataAccessException, ParseException;
  public List<String> confirmDetail(String[] numberAry) throws DataAccessException;
  public List<OperationInsClosingVO> selectAllOperationInsClosingInfo(String startDate, String endDate)	throws DataAccessException, ParseException;
  public List<OperationInsClosingVO> selectAllOperationInsClosingInfoDetail(String number) throws DataAccessException, ParseException;
  public List<String> closingDetail(String[] numberAry) throws DataAccessException;
  public List<String> closingCancleDetail(String[] numberAry) throws DataAccessException;
  public List<String> revertDetail(String[] numberAry) throws DataAccessException;
  public List<OperationRegistVO> selectRelease(String number) throws DataAccessException, ParseException;
  public List<OperationRegistVO> selectReleaseDetail(String number) throws DataAccessException, ParseException;
  public List<String> MaterialUse(String[] numberAry) throws DataAccessException;
  public List<RegistOperationPerformanceVO> selectAllRegistOperationPerformanceInfo(String startDate, String endDate) throws DataAccessException, ParseException;
  public List<RegistOperationPerformanceVO> selectAllRegistOperationPerformanceInfoDetail(String number) throws DataAccessException, ParseException;
  public int addRegistOperationPerformanceInfoDetail(RegistOperationPerformanceDetailVO ROPDVO) throws DataAccessException;
  public int addReleaseData(OperationDetailVO ORVO) throws DataAccessException;
  public int delCommitOperation(OperationDetailVO ODVO) throws DataAccessException;
  public List houseCodeSearch() throws DataAccessException;
  public List processCodeSearch() throws DataAccessException;
  public List workplaceCodeSearch() throws DataAccessException;
  public List<CommitOperationInstructionVO> selectAllProductionPlanInfo() throws DataAccessException; 
  public List<OperationRegistVO> selectAllOperationInfo() throws DataAccessException;
  public void deleteRegistOperationPerformanceInfoDetail(String[] numberAry) throws DataAccessException;
  public List facilitySearch() throws DataAccessException;
  public List checkStock(String itemCode) throws DataAccessException;
  public int minValue(String itemCode) throws DataAccessException;
  public List selectAllWorkInProcess() throws DataAccessException, ParseException;
  public List selectAllWorkInProcessCondition(String info) throws DataAccessException, ParseException;
  }
 