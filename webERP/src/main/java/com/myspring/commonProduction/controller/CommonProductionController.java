package com.myspring.commonProduction.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;
import com.myspring.commonProduction.operationRegist.vo.OperationDetailVO;
import com.myspring.commonProduction.operationRegist.vo.OperationRegistVO;
import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceDetailVO;

public interface CommonProductionController {

	public ModelAndView listProductInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listOpertaionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView codeHelper(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView departmentSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView productionPlanSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView productionPlanResposne(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addOperationInstruction(OperationRegistVO ORVO, HttpServletRequest request,	HttpServletResponse response) throws Exception;
	public ModelAndView delOperationInstruction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updOperationInstruction(OperationRegistVO ORVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView itemCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView delProductionPlan(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addProductionPlan(CommitOperationInstructionVO COIVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updProductionPlan(CommitOperationInstructionVO COIVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listCommitOpertaionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView confirmDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listOperationInsClosingInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView closingDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView closingCancleDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView revertDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView releaseDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listRegistOperationPerformanceInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView MaterialUse(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addRegistOperationPerformanceInfoDetail(RegistOperationPerformanceDetailVO ROPDVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addReleaseData(OperationDetailVO ORVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView delCommitOperation(OperationDetailVO ODVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView houseCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView processCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView workplaceCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteRegistOperationPerformanceInfoDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView facilitySearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView checkStock(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView processInWork(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
