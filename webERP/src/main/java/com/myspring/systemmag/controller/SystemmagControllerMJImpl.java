package com.myspring.systemmag.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.systemmag.dao.SystemmagDAOMJ;
import com.myspring.systemmag.service.SystemmagServiceMJ;
import com.myspring.systemmag.vo.SystemmagVOMJ;

@Controller("SystemmagControllerMJ")
public class SystemmagControllerMJImpl implements SystemmagControllerMJ {
	@Autowired
	private SystemmagServiceMJ systemmagService;
	@Autowired
	private SystemmagVOMJ systemmagVO;
	@Autowired
	private SystemmagDAOMJ systemmagDAO;

	@Override
	@RequestMapping(value = "/member/addbasicacc.do", method = RequestMethod.GET)
	public ModelAndView addCustomer(@ModelAttribute("company") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = systemmagService.addCustomer(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:" + path);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/regbasicacc.do", method = RequestMethod.GET)
	public ModelAndView viewCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit"); 
		String com_code = (String) request.getParameter("com_code");
		String customerCode = (String) request.getParameter("customerCode");

		if (com_code == null && submit == null) { 
			if(customerCode != null) {				
				List customerList = null;
				List comcom = null;
				customerList = systemmagService.viewCustomer(customerCode);
				comcom = systemmagService.viewCustomer(customerCode);
				mav = new ModelAndView(viewName);
				mav.addObject("comView", customerList);	
				mav.addObject("comcom", comcom);
				return mav;
			}
			else {
				List comView = systemmagService.viewAllCustomer(); 
				mav = new ModelAndView(viewName);
				mav.addObject("comView", comView);
				return mav;
			}
		}

		else if (submit.equals("1")) { 
			List comView = systemmagService.viewAllCustomer();
			List comcom = systemmagService.viewCustomer(com_code); 
			mav = new ModelAndView(viewName);
			mav.addObject("comView", comView);
			mav.addObject("comcom", comcom);
		}
		return mav;
	}

	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
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
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

	@Override
	@RequestMapping(value = "/member/deleteBasicacc.do", method = RequestMethod.GET)
	public ModelAndView deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no"); 
		String viewName = getViewName(request);
		String[] numberary = number.split(","); 

		systemmagService.delCustomer(numberary);

		ModelAndView mav = new ModelAndView("redirect:/member/regbasicacc.do");

		return mav;

	}

	@Override
	@RequestMapping(value = "/member/updateBasicacc.do", method = RequestMethod.GET)
	public ModelAndView updateCustomer(@ModelAttribute("") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		systemmagService.updCustomer(systemmagVO);
		ModelAndView mav = new ModelAndView(
				"redirect:/member/regbasicacc.do?submit=1&&com_code=" + systemmagVO.getGeneral_Customer_Code());
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/regbasicaccPopup.do", method = RequestMethod.GET)
	public ModelAndView popupCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List comView = systemmagService.viewAllCustomer();
		mav = new ModelAndView(viewName);
		mav.addObject("comView", comView); 

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/regbasicaccZipPopup.do", method = RequestMethod.GET)
	public ModelAndView popupZipCustomer(@ModelAttribute("") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String com_code = request.getParameter("com_code");

		List ZipView = systemmagService.zipViewCustomer(); 
		mav = new ModelAndView(viewName);
		mav.addObject("ZipView", ZipView); 
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/outware.do", method = RequestMethod.GET)
	public ModelAndView viewOutware(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit");
		String code = (String) request.getParameter("com_code");
		String outwareCode = (String) request.getParameter("outwareCode");
		String processCode = (String) request.getParameter("processCode");
		String outsourcingCode = (String) request.getParameter("outsourcingCode");
		if (code == null && submit == null) { 
			System.out.println("1�뜝�룞�삕�뜝�떩源띿삕�뜝�룞�삕�뜝占�");
			List houOutwareList = systemmagService.viewAllHouOutware(); 
			List proOutwareList = systemmagService.viewAllProOutware();
			List outOutwareList = systemmagService.viewAllOutOutware();

			List houWorOutwareList = systemmagService.viewAllHouWorOutware(); 
			List proWorOutwareList = systemmagService.viewAllProWorOutware();
			List outWorOutwareList = systemmagService.viewAllOutWorOutware();

			mav = new ModelAndView(viewName);
			if(outwareCode==null) {
				mav.addObject("houOutwareList", houOutwareList);
			}else {
				List  houOutwareSelectedList = systemmagService.viewSelectedHouOutware(outwareCode);
				mav.addObject("houOutwareList", houOutwareSelectedList);
			}
			if(processCode==null) {
				mav.addObject("proOutwareList", proOutwareList);
			}else {
				List  proOutwareSelectedList = systemmagService.viewSelectedProOutware(processCode);
				mav.addObject("proOutwareList", proOutwareSelectedList);
			}
			if(outsourcingCode==null) {
				mav.addObject("outOutwareList", outOutwareList);
			}else {
				List  outOutwareSelectedList = systemmagService.viewSelectedOutOutware(outsourcingCode);
				mav.addObject("outOutwareList", outOutwareSelectedList);
			}
			mav.addObject("houWorOutwareList", houWorOutwareList);
			mav.addObject("proWorOutwareList", proWorOutwareList);
			mav.addObject("outWorOutwareList", outWorOutwareList);
			return mav;
		}

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/outwarePopup1.do", method = RequestMethod.GET)
	public ModelAndView popupOutware1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List outwareView = systemmagService.viewAllHouOutware(); 
		mav = new ModelAndView(viewName);
		mav.addObject("outwareView", outwareView); 

		return mav;
	}
	@Override
	@RequestMapping(value = "/member/outwarePopup2.do", method = RequestMethod.GET)
	public ModelAndView popupOutware2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List outwareView = systemmagService.viewAllProOutware(); 
		mav = new ModelAndView(viewName);
		mav.addObject("outwareView", outwareView); 

		return mav;
	}
	@Override
	@RequestMapping(value = "/member/outwarePopup3.do", method = RequestMethod.GET)
	public ModelAndView popupOutware3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List outwareView = systemmagService.viewAllOutOutware(); 
		mav = new ModelAndView(viewName);
		mav.addObject("outwareView", outwareView); 

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logistics_manage.do", method = RequestMethod.GET)
	public ModelAndView viewLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit");
		String code = (String) request.getParameter("com_code");
		String logisSearchBox = (String) request.getParameter("logisSearchBox");

		if (code == null && submit == null) {			
			if(logisSearchBox != null) {				
				List allLogisticsList = null;
				List logisticsSelectedView = null;
				allLogisticsList = systemmagService.viewSelectedLogistics(logisSearchBox);
				logisticsSelectedView = systemmagService.viewSelectedLogistics(logisSearchBox);
				
				mav = new ModelAndView(viewName);
				mav.addObject("logisticsView", allLogisticsList);	
				mav.addObject("logisticsSelectedView", logisticsSelectedView);
				return mav;
			}
			else {
				List logisticsView = systemmagService.viewAllLogistics();
				mav = new ModelAndView(viewName);
				mav.addObject("logisticsView", logisticsView);
				return mav;
			}
		}

		else if (submit.equals("1")) { 
			List logisticsView = systemmagService.viewAllLogistics(); 
			List logisticsSelectedView = systemmagService.viewSelectedLogistics(code);
			mav = new ModelAndView(viewName);
			mav.addObject("logisticsView", logisticsView);
			mav.addObject("logisticsSelectedView", logisticsSelectedView);
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/addLogistics_manage.do", method = RequestMethod.GET)
	public ModelAndView addLogistics(@ModelAttribute("logistics") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = systemmagService.addLogistics(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:" + path);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/deleteLogistics_manage.do", method = RequestMethod.GET)
	public ModelAndView deleteLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = number.split(","); 

		systemmagService.deleteLogistics(numberary);

		ModelAndView mav = new ModelAndView("redirect:/member/logistics_manage.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/updateLogistics_manage.do", method = RequestMethod.GET)
	public ModelAndView updateLogistics(SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		systemmagService.updateLogistics(systemmagVO);
		ModelAndView mav = new ModelAndView(
				"redirect:/member/logistics_manage.do?submit=1&&com_code=" + systemmagVO.getLogistics_In_Code());
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/logisticsPopup.do", method = RequestMethod.GET)
	public ModelAndView popupLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List logisticsView = systemmagService.viewAllLogistics();
		mav = new ModelAndView(viewName);
		mav.addObject("logisticsView", logisticsView);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/addInspection.do", method = RequestMethod.GET)
	public ModelAndView addInspection(@ModelAttribute("Ins") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = systemmagService.addInspection(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:/member/reginspection.do?submit=1&&com_code=" + systemmagVO.getInspection_Code());
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/reginspection.do", method = RequestMethod.GET)
	public ModelAndView viewInspection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit"); 
		String com_code = (String) request.getParameter("com_code");

		if (com_code == null && submit == null) { 
			List insView = systemmagService.viewAllInspection();
			mav = new ModelAndView(viewName);
			mav.addObject("insView", insView);
			return mav;
		}

		else if (submit.equals("1")) {
			List insView = systemmagService.viewAllInspection();
			List insins = systemmagService.viewInspection(com_code);
			mav = new ModelAndView(viewName);
			mav.addObject("insView", insView);
			mav.addObject("insins", insins);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/deleteInspection.do", method = RequestMethod.GET)
	public ModelAndView deleteInspection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");

		systemmagService.delInspection(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/reginspection.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/updateInspection.do", method = RequestMethod.GET)
	public ModelAndView updateInspection(@ModelAttribute("") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		systemmagService.updInspection(systemmagVO);
		ModelAndView mav = new ModelAndView(
				"redirect:/member/reginspection.do?submit=1&&com_code=" + systemmagVO.getInspection_Code());
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/addSetComponents.do", method = RequestMethod.GET)
	public ModelAndView addSetComponents(@ModelAttribute("Set") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = systemmagService.addSetComponents(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:/member/regsetcom.do?");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/regsetcom.do", method = RequestMethod.GET)
	public ModelAndView viewSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit");
		String com_code = (String) request.getParameter("com_code");

		if (com_code == null && submit == null) {
			List setView = systemmagService.viewAllSetComponents();
			mav = new ModelAndView(viewName);
			mav.addObject("setView", setView);
			return mav;
		}

		else if (submit.equals("1")) {
			List setView = systemmagService.viewAllSetComponents();
			List compoView = systemmagService.viewSpecComponents(com_code);
			mav = new ModelAndView(viewName);
			mav.addObject("setView", setView);
			mav.addObject("compoView", compoView);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/deleteSetComponents.do", method = RequestMethod.GET)
	public ModelAndView deleteSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");

		systemmagService.delSetComponents(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regsetcom.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/updateSetComponents.do", method = RequestMethod.GET)
	public ModelAndView updateSetComponents(SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		systemmagService.updSetComponents(systemmagVO);
		ModelAndView mav = new ModelAndView(
				"redirect:/member/regsetcom.do?submit=1&&com_code=" + systemmagVO.getSet_Code());
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/popupSetComponents.do", method = RequestMethod.GET)
	public ModelAndView popupSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List setView = systemmagService.viewAllSetComponents();
		mav = new ModelAndView(viewName);
		mav.addObject("setView", setView);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/addSpecComponents.do", method = RequestMethod.GET)
	public ModelAndView addSpecComponents(@ModelAttribute("Set") SystemmagVOMJ systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = systemmagService.addSpecComponents(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:/member/regsetcom.do?&submit=1&&com_code="+systemmagVO.getSet_Code());
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/deleteSpecComponents.do", method = RequestMethod.GET)
	public ModelAndView deleteSpecComponents(@ModelAttribute("Spec") SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no2");
		String setCode = (String) request.getParameter("com_code");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");

		System.out.println("setCode:"+setCode);
		systemmagService.delSpecComponents(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regsetcom.do?&submit=1&&com_code="+setCode);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/searchPopCompoItemName.do", method = RequestMethod.GET)
	public ModelAndView searchPopCompoItemName(@ModelAttribute("") SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List compoView = systemmagService.searchPopCompoItemName();
		mav = new ModelAndView(viewName);
		mav.addObject("compoView", compoView); 

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/viewPopupSet.do", method = RequestMethod.GET)
	public ModelAndView viewPopupSet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List setView = systemmagService.viewAllSetComponents();
		mav = new ModelAndView(viewName);
		mav.addObject("setView", setView); 

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/viewPopupSpec.do", method = RequestMethod.GET)
	public ModelAndView viewPopupSpec(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = null;
		String viewName = getViewName(request);

		List compoView = systemmagService.viewAllSpecComponents();
		mav = new ModelAndView(viewName);
		mav.addObject("compoView", compoView); 

		return mav;
	}
	
	
	
	//AJAX CONTROLLER----------------------------------
	@ResponseBody
	@RequestMapping(value = "/member/searchPopCustomerName.do", method = RequestMethod.GET)
	public ModelAndView searchPopCustomerName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopCustomerName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopZipCodeName.do", method = RequestMethod.GET)
	public ModelAndView searchPopZipCodeName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopZipCodeName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopLogisticsName.do", method = RequestMethod.GET)
	public ModelAndView searchPopLogisticsName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopLogisticsName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopOutwareName.do", method = RequestMethod.GET)
	public ModelAndView searchPopOutwareName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopOutwareName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopCompoItemNameAjax.do", method = RequestMethod.GET)
	public ModelAndView searchPopCompoItemNameAjax(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopCompoItemNameAjax(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopSpecItemNameAjax.do", method = RequestMethod.GET)
	public ModelAndView searchPopSpecItemNameAjax(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = systemmagService.searchPopSpecItemNameAjax(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	


}
