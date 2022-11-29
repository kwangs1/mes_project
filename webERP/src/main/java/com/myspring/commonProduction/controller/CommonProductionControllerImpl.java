
package com.myspring.commonProduction.controller;
  
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
  
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.servlet.ModelAndView;
  
import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO; 
 import com.myspring.commonProduction.operationRegist.vo.OperationRegistVO;
 import com.myspring.commonProduction.registOperationPerformance.vo.RegistOperationPerformanceDetailVO;
 import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;
 import com.myspring.commonProduction.operationRegist.vo.OperationDetailVO;
 import com.myspring.commonProduction.operationRegist.vo.OperationRegistVO; 
 import com.myspring.commonProduction.service.CommonProductionService;
 import com.myspring.productionBaseInfo.BOM.vo.bomVO;
  
   @Controller("CommonProductionController") 
   public class CommonProductionControllerImpl implements CommonProductionController{ 
 	  private static final Logger logger = LoggerFactory.getLogger(CommonProductionControllerImpl.class);
 	  @	Autowired private CommonProductionService productionService;
 	  @Autowired private CommitOperationInstructionVO COIVO;
 	  @Autowired private OperationRegistVO ORVO;
 	  @Autowired private RegistOperationPerformanceDetailVO ROPDVO;
   
 	  @Override
 	  @RequestMapping(value="/member/proplanreg.do" ,method = RequestMethod.GET)
   		public ModelAndView listProductInfo(HttpServletRequest request, HttpServletResponse response) throws Exception { 
 		  ModelAndView mav = null;
 			String viewName = getViewName(request);
 			String submit = (String) request.getParameter("submit");
 			String itemCode = (String) request.getParameter("itemCode");
 			String startDate = request.getParameter("startDate");
 			String endDate = request.getParameter("endDate");			
 			int sum = 0;
 			if(itemCode == null || itemCode.length() == 0 || submit.equals("0")) {
 				mav = new ModelAndView(viewName);
 				return mav;
 			}
 			else if(submit.equals("1")){
 				List infoList = productionService.selectAllProductionPlanInfo(itemCode,startDate,endDate);
 				mav = new ModelAndView(viewName);				
 				mav.addObject("infoList", infoList);
 			}				
 			return mav;
 	  	}
 
 	  @Override
 	  @RequestMapping(value="/member/itemCodePop.do" ,method = RequestMethod.GET)
 		public ModelAndView itemCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String viewName = getViewName(request);
 			List itemView = productionService.itemCodeSearch();
 			ModelAndView mav = new ModelAndView(viewName);
 			mav.addObject("itemView", itemView);
 			return mav;
 		}
 	  
 	  @Override
 	  @RequestMapping(value="/member/checkStock.do" ,method = RequestMethod.GET)
 		public ModelAndView checkStock(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String viewName = getViewName(request);
 			String itemCode = (String) request.getParameter("parentItemCode");
 			String dailyProduction = (String) request.getParameter("dailyProduction");
 			List itemView = productionService.checkStock(itemCode);
 			int minValue = productionService.minValue(itemCode);
 			ModelAndView mav = new ModelAndView(viewName);
 			mav.addObject("itemView", itemView);
 			mav.addObject("dailyProduction", dailyProduction);
 			mav.addObject("minValue", minValue);
 			return mav;
 		}
  	//�깮�궛怨꾪쉷 �벑濡� CRUD
 	  	@Override
 		@RequestMapping(value="/member/delProductionPlan.do" ,method = RequestMethod.GET)
 		public ModelAndView delProductionPlan(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String number = (String) request.getParameter("productionPlanCode");
 			String viewName = getViewName(request);
 			String[] codeArary = number.split(",");
 			productionService.delProductionPlan(codeArary);
 			ModelAndView mav = new ModelAndView("redirect:/member/proplanreg.do");
 			return mav;
 			}
 	  
 	  	@Override
 	  	@RequestMapping(value="/member/updateProductionPlan.do" ,method = RequestMethod.GET)
 	  	public ModelAndView updProductionPlan(@ModelAttribute("info") CommitOperationInstructionVO COIVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
 		  		request.setCharacterEncoding("utf-8");
 		  		String path = request.getParameter("path");
 				path = path.replace("/webERP", "");
 		  		int result = 0;
 		  		result = productionService.updProductionPlan(COIVO);
 		  		System.out.println("result "+result);
 		  		ModelAndView mav = new ModelAndView("redirect:"+path);
 		  		return mav;
 	  		}
 	  	
 	  	@Override
 		@RequestMapping(value="/member/addProductionPlan.do" ,method = RequestMethod.GET)
 		public ModelAndView addProductionPlan(@ModelAttribute("info") CommitOperationInstructionVO COIVO, HttpServletRequest request,
 				HttpServletResponse response) throws Exception {
 			request.setCharacterEncoding("utf-8");
 			String path = request.getParameter("path");
 			path = path.replace("/webERP", "");
 			System.out.println("url" + path);
 			int result = 0;
 			result = productionService.addProductionPlan(COIVO);
 			ModelAndView mav = new ModelAndView("redirect:"+path);
 			return mav;
 		}
  	//�옉�뾽吏��떆�벑濡� 湲곕뒫 遺�
   @Override
   @RequestMapping(value="/member/regoperins.do" ,method = RequestMethod.GET)
   public ModelAndView listOpertaionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception { 
 	  String startDate = request.getParameter("startDate");
 	  String endDate = request.getParameter("endDate");
 	  String viewName = (String)request.getAttribute("viewName");
 	  logger.debug("debug 占쎌쟿獄쏉옙 : viewName = " + viewName); 
 	  List infoList = productionService.selectAllOperationInfo(startDate, endDate); 
 	  ModelAndView mav = new ModelAndView(viewName); 
 	  mav.addObject("infoList", infoList); 
 	  return mav; 
   	}
   
   @Override
   @RequestMapping(value="/member/factorySearch.do" ,method = RequestMethod.GET)
 	public ModelAndView codeHelper(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String viewName = getViewName(request);
 		List itemView = productionService.itemView();
 		ModelAndView mav = new ModelAndView(viewName);
 		mav.addObject("itemView", itemView);
 		return mav;
 	}
   
   @RequestMapping(value="/member/departmentSearch.do" ,method = RequestMethod.GET)
 	public ModelAndView departmentSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String viewName = getViewName(request);
 		List departmentView = productionService.departmentView();
 		ModelAndView mav = new ModelAndView(viewName);
 		mav.addObject("departmentView", departmentView);
 		return mav;
 	}
   
   @Override
   @RequestMapping(value="/member/productionPlanSearch.do",method = RequestMethod.GET)
   	public ModelAndView productionPlanSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
 	  String viewName = getViewName(request);
 	  ModelAndView mav = new ModelAndView(viewName);
 	  return mav;
   }
   
   @Override
   @RequestMapping(value="/member/productionPlanResponse.do",method = RequestMethod.GET)
   	public ModelAndView productionPlanResposne(HttpServletRequest request, HttpServletResponse response) throws Exception{
 	  String startDate = request.getParameter("dateStart");
 	  String endDate = request.getParameter("dateEnd");
 	  String viewName = getViewName(request);
 	  List productionPlanView = productionService.productionPlanView(startDate, endDate);
 	  ModelAndView mav = new ModelAndView(viewName);
 	  mav.addObject("productionPlanView", productionPlanView);
 	  return mav;
   }
   
   	@Override
 	@RequestMapping(value="/member/addOperationInstruction.do" ,method = RequestMethod.GET)
 	public ModelAndView addOperationInstruction(@ModelAttribute("info") OperationRegistVO ORVO, HttpServletRequest request,
 			HttpServletResponse response) throws Exception {
 		request.setCharacterEncoding("utf-8");
 		String path = request.getParameter("path");
 		path = path.replace("/webERP", "");
 		System.out.println("url" + path);
 		int result = 0;
 		result = productionService.addOperationInstruction(ORVO);
 		ModelAndView mav = new ModelAndView("redirect:"+path);
 		return mav;
 	}
   
   	@Override
   	@RequestMapping(value="/member/updateOperationInstruction.do" ,method = RequestMethod.GET)
   	public ModelAndView updOperationInstruction(@ModelAttribute("info") OperationRegistVO ORVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
 	  		request.setCharacterEncoding("utf-8");
 	  		int result = 0;
 	  		result = productionService.updOperationInstruction(ORVO);
 	  		System.out.println("result "+result);
 	  		ModelAndView mav = new ModelAndView("redirect:/member/regoperins.do");
 	  		return mav;
   		}
   	
   	@Override
 	@RequestMapping(value="/member/delOperationInstruction.do" ,method = RequestMethod.GET)
 	public ModelAndView delOperationInstruction(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String number = (String) request.getParameter("workOrderNumber");
 		String viewName = getViewName(request);
 		String[] numberary = number.split(",");
 		productionService.delOperationInstruction(numberary);
 		ModelAndView mav = new ModelAndView("redirect:/member/regoperins.do");
 		return mav;
 		}
   	
   	@Override
 	@RequestMapping(value="/member/facilitySearchPop.do" ,method = RequestMethod.GET)
 	public ModelAndView facilitySearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String viewName = getViewName(request);
 		List itemView = productionService.facilitySearch();
 		ModelAndView mav = new ModelAndView(viewName);
 		mav.addObject("itemView", itemView);
 		return mav;
 	}
   	
    //�옉�뾽吏��떆 �솗�젙 湲곕뒫遺� 
   	 @Override
   	  @RequestMapping(value="/member/comoperins.do" ,method = RequestMethod.GET)
   	  public ModelAndView listCommitOpertaionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception { 
   		  String startDate = request.getParameter("startDate");
   		  String endDate = request.getParameter("endDate");
   		  String number = request.getParameter("searchNumber");  		  
   		  String viewName = (String)request.getAttribute("viewName");
   		  ModelAndView mav = new ModelAndView(viewName); 
   		  logger.debug("debug : viewName = " + viewName);
   		  
   		  if(number != null && number != "") {
   			  List infoList = productionService.selectAllCommitOperationInfo(startDate, endDate);
   			  List detailList = productionService.selectAllCommitOperationInfoDetail(number);
   			  mav.addObject("infoList", infoList); 
   			  mav.addObject("detailList", detailList);
   		  } else {
   			List infoList = productionService.selectAllCommitOperationInfo(startDate, endDate); 
   			mav.addObject("infoList", infoList); 
   		  }
   		  return mav; 
   	  	}
   	 
  	@Override
  	@RequestMapping(value="/member/confirmDetail.do" ,method = RequestMethod.GET)
  	public ModelAndView confirmDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String number = (String) request.getParameter("workOrderNumber");
  		String viewName = getViewName(request);
  		String[] numberary = number.split(",");
  		List<String> message = new ArrayList();
  		message = productionService.confirmDetail(numberary);
  		ModelAndView mav = new ModelAndView("redirect:/member/comoperins.do");
  		System.out.println("而⑦듃濡ㅻ윭 �솗�씤"+message);
  		mav.addObject("message",message);
  		return mav;
  		}
  	
  	@Override
  	@RequestMapping(value="/member/revertDetail.do" ,method = RequestMethod.GET)
  	public ModelAndView revertDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String number = (String) request.getParameter("workOrderNumber");
  		String viewName = getViewName(request);
  		String[] numberary = number.split(",");
  		List<String> message = new ArrayList();
  		message = productionService.revertDetail(numberary);
  		ModelAndView mav = new ModelAndView("redirect:/member/comoperins.do");
  		System.out.println("而⑦듃濡ㅻ윭 �솗�씤"+message);
  		mav.addObject("message",message);
  		return mav;
  	}
  
  	@Override
   	@RequestMapping(value="/member/deleteCommitOperation.do" ,method = RequestMethod.GET)
   	public ModelAndView delCommitOperation(@ModelAttribute("info") OperationDetailVO ODVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
 	  		request.setCharacterEncoding("utf-8");
 	  		int result = 0;
 	  		result = productionService.delCommitOperation(ODVO);
 	  		System.out.println("result "+result);
 	  		ModelAndView mav = new ModelAndView("redirect:/member/comoperins.do");
 	  		return mav;
   		}
  	
   //�옉�뾽吏��떆 �솗�젙 �옄�옱異쒓퀬 遺� 湲곕뒫
 
  	@Override
  	@RequestMapping(value="/member/inscomoperins.do" ,method = RequestMethod.GET)
  	public ModelAndView releaseDetail(HttpServletRequest request, HttpServletResponse response) throws Exception { 
  		String number = request.getParameter("workOrderNumber");
  		String viewName = (String)request.getAttribute("viewName");
  		ModelAndView mav = new ModelAndView(viewName); 
  		
  		List infoList = productionService.selectRelease(number);
  		List detailList = productionService.selectReleaseDetail(number);
  		mav.addObject("infoList", infoList); 
 		mav.addObject("detailList", detailList);
  		return mav; 
  	}
  	
  	@Override
 	@RequestMapping(value="/member/addReleaseData.do" ,method = RequestMethod.GET)
 	public ModelAndView addReleaseData(@ModelAttribute("info") OperationDetailVO ORVO, HttpServletRequest request,
 			HttpServletResponse response) throws Exception {
 		request.setCharacterEncoding("utf-8");
 		String path = request.getParameter("path");
 		path = path.replace("/webERP", "");
 		System.out.println("url" + path);
 		int result = 0;
 		result = productionService.addReleaseData(ORVO);
 		ModelAndView mav = new ModelAndView("redirect:"+path);
 		return mav;
 	}
  	
  	
    //�옉�뾽�떎�쟻�벑濡� 湲곕뒫遺� 
   	 @Override
   	  @RequestMapping(value="/member/regoperperf.do" ,method = RequestMethod.GET)
   	  public ModelAndView listRegistOperationPerformanceInfo(HttpServletRequest request, HttpServletResponse response) throws Exception { 
   		  String startDate = request.getParameter("startDate");
   		  String endDate = request.getParameter("endDate");
   		  String number = request.getParameter("searchNumber");
   		  String viewName = (String)request.getAttribute("viewName");
   		  ModelAndView mav = new ModelAndView(viewName); 
   		  logger.debug("debug : viewName = " + viewName);
   		  
   		  if(number != null && number != "") {
   			  List infoList = productionService.selectAllRegistOperationPerformanceInfo(startDate, endDate);
   			  List detailList = productionService.selectAllRegistOperationPerformanceInfoDetail(number);
   			  mav.addObject("infoList", infoList); 
   			  mav.addObject("detailList", detailList);
   		  } else {
   			List infoList = productionService.selectAllRegistOperationPerformanceInfo(startDate, endDate); 
   			mav.addObject("infoList", infoList); 
   		  }
   		  return mav; 
   	  	}
   	 
   	@Override
 	@RequestMapping(value="/member/addRegistOperationPerformanceInfoDetail.do" ,method = RequestMethod.GET)
 	public ModelAndView addRegistOperationPerformanceInfoDetail(@ModelAttribute("detail") RegistOperationPerformanceDetailVO ROPDVO, HttpServletRequest request,
 			HttpServletResponse response) throws Exception {
 		request.setCharacterEncoding("utf-8");
 		String path = request.getParameter("path");
 		path = path.replace("/webERP", "");
 		System.out.println("url" + path);
 		int result = 0;
 		result = productionService.addRegistOperationPerformanceInfoDetail(ROPDVO);
 		ModelAndView mav = new ModelAndView("redirect:"+path);
 		return mav;
 	}
 	
  	@Override
  	@RequestMapping(value="/member/materialUse.do" ,method = RequestMethod.GET)
  	public ModelAndView MaterialUse(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String number = (String) request.getParameter("opNumber");
  		String viewName = getViewName(request);
  		String[] numberary = number.split(",");
  		List<String> message = new ArrayList();
  		message = productionService.MaterialUse(numberary);
  		ModelAndView mav = new ModelAndView("redirect:/member/regoperperf.do");
  		System.out.println("而⑦듃濡ㅻ윭 �솗�씤"+message);
  		mav.addObject("message",message);
  		return mav;
  	}
  	
  	@Override
 	@RequestMapping(value="/member/deleteRegistOperationPerformanceInfoDetail.do" ,method = RequestMethod.GET)
 	public ModelAndView deleteRegistOperationPerformanceInfoDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
 		String number = (String) request.getParameter("opNumber");
 		String viewName = getViewName(request);
 		String[] numberary = number.split(",");
 		productionService.deleteRegistOperationPerformanceInfoDetail(numberary);
 		ModelAndView mav = new ModelAndView("redirect:/member/regoperperf.do");
 		return mav;
 		}
  	
   	//�옉�뾽�떎�쟻 �벑濡� �뙘�뾽遺�
  	
  		@Override
  		@RequestMapping(value="/member/houseCodeSearchPop.do" ,method = RequestMethod.GET)
 		public ModelAndView houseCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String viewName = getViewName(request);
 			List itemView = productionService.houseCodeSearch();
 			ModelAndView mav = new ModelAndView(viewName);
 			mav.addObject("itemView", itemView);
 			return mav;
 		}
   	 
  		@Override
  		@RequestMapping(value="/member/processCodeSearchPop.do" ,method = RequestMethod.GET)
 		public ModelAndView processCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String viewName = getViewName(request);
 			List itemView = productionService.processCodeSearch();
 			ModelAndView mav = new ModelAndView(viewName);
 			mav.addObject("itemView", itemView);
 			return mav;
 		}
  		
  		@Override
  		@RequestMapping(value="/member/workplaceCodeSearchPop.do" ,method = RequestMethod.GET)
 		public ModelAndView workplaceCodeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
 			String viewName = getViewName(request);
 			List itemView = productionService.workplaceCodeSearch();
 			ModelAndView mav = new ModelAndView(viewName);
 			mav.addObject("itemView", itemView);
 			return mav;
 		}
    //�옉�뾽吏��떆 留덇컧泥섎━ 湲곕뒫遺� 
   	 @Override
   	  @RequestMapping(value="/member/operinsclo.do" ,method = RequestMethod.GET)
   	  public ModelAndView listOperationInsClosingInfo(HttpServletRequest request, HttpServletResponse response) throws Exception { 
   		  String startDate = request.getParameter("startDate");
   		  String endDate = request.getParameter("endDate");
   		  String number = request.getParameter("searchNumber");
   		  String viewName = (String)request.getAttribute("viewName");
   		  ModelAndView mav = new ModelAndView(viewName); 
   		  logger.debug("debug : viewName = " + viewName);
   		  
   		  if(number != null && number != "") {
   			  List infoList = productionService.selectAllOperationInsClosingInfo(startDate, endDate);
   			  List detailList = productionService.selectAllOperationInsClosingInfoDetail(number);
   			  mav.addObject("infoList", infoList); 
   			  mav.addObject("detailList", detailList);
   		  } else {
   			List infoList = productionService.selectAllOperationInsClosingInfo(startDate, endDate); 
   			mav.addObject("infoList", infoList); 
   		  }
   		  return mav; 
   	  	}
   	 
  	@Override
  	@RequestMapping(value="/member/closingDetail.do" ,method = RequestMethod.GET)
  	public ModelAndView closingDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String number = (String) request.getParameter("workOrderNumber");
  		String viewName = getViewName(request);
  		String[] numberary = number.split(",");
  		List<String> message = new ArrayList();
  		 List<String> cancleMessage = new ArrayList();
  		message = productionService.closingDetail(numberary);
  		 //cancleMessage = productionService.closingCancleDetail(numberary);
  		ModelAndView mav = new ModelAndView("redirect:/member/operinsclo.do");
  		mav.addObject("message",message);
  		return mav;
  		}
  	
  	@Override
  	@RequestMapping(value="/member/closingCancleDetail.do" ,method = RequestMethod.GET)
  	public ModelAndView closingCancleDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
  		String number = (String) request.getParameter("workOrderNumber");
  		String viewName = getViewName(request);
  		String[] numberary = number.split(",");
  		List<String> message = new ArrayList();
  		message = productionService.closingCancleDetail(numberary);
  		ModelAndView mav = new ModelAndView("redirect:/member/operinsclo.do");
  		mav.addObject("message",message);
  		return mav;
  		}
   	 
   	//재공 파트 기능부
  	 @Override
 	  @RequestMapping(value="/member/processinwork.do" ,method = RequestMethod.GET)
  		public ModelAndView processInWork(HttpServletRequest request, HttpServletResponse response) throws Exception { 
 		  ModelAndView mav = null;
 			String viewName = getViewName(request);
 			String submit = (String) request.getParameter("submit");
 			String itemCode = (String) request.getParameter("itemNumber");					
 			
 			if(itemCode == null || itemCode.length() == 0 || submit.equals("0")) {
 				List infoList = productionService.selectAllWorkInProcess();
 				mav = new ModelAndView(viewName);
 				mav.addObject("infoList", infoList);
 				return mav;
 			}
 			else if(submit.equals("1")){
 				List infoList = productionService.selectAllWorkInProcessCondition(itemCode);
 				mav = new ModelAndView(viewName);				
 				mav.addObject("infoList", infoList);
 			}				
 			return mav;
 	  	}
  	 
   private String getViewName(HttpServletRequest request) throws Exception {
 	  String contextPath = request.getContextPath(); 
 	  String uri = (String) request.getAttribute("javax.servlet.include.request_uri"); 
 	  if (uri == null || uri.trim().equals("")) { uri = request.getRequestURI(); 
 	  }
   
   	int begin = 0; 
   	if (!((contextPath == null) || ("".equals(contextPath)))) {
   		begin = contextPath.length(); 
   		}
   
   	int end; 
   	if (uri.indexOf(";") != -1) { 
   		end = uri.indexOf(";"); 
   		} else if (uri.indexOf("?") != -1) { 
   			end = uri.indexOf("?"); 
   		} else { 
   			end = uri.length(); 
   		}
   
   	String viewName = uri.substring(begin, end); 
   	if (viewName.indexOf(".") != -1) { 
   		viewName = viewName.substring(0, viewName.lastIndexOf(".")); 
   		}
   	if (viewName.lastIndexOf("/") != -1) { 
   		viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length()); 
   		} 
   	return viewName; 
   	} 
  }
  