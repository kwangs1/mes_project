package com.myspring.invenBasicInfo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.invenBasicInfo.service.IupViewService;
import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;


@Controller("iupMemberController")
//@EnableAspectJAutoProxy
public class IupViewControllerImpl implements IupViewController {
	private static final Logger logger = LoggerFactory.getLogger(IupViewControllerImpl.class);
	@Autowired
	private IupViewService iupViewService;
	@Autowired
	private iupVO iupVO ;
	
	@Override
	@RequestMapping(value="/member/itemunitprice.do" ,method = RequestMethod.GET)
	public ModelAndView viewIup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String itemNumber = (String) request.getParameter("itemNumber");
		String submit = (String) request.getParameter("submit");
		int sum = 0;
		System.out.println(submit);
		if(itemNumber == null||itemNumber.length() ==0 || submit.equals("0")) {
			List iupView = iupViewService.iupView();
			mav = new ModelAndView(viewName);
			mav.addObject("iupView", iupView);
			return mav;
		}
		else if(submit.equals("1")){
			List iupView = iupViewService.SearchView(itemNumber);
			mav = new ModelAndView(viewName);
			mav.addObject("iupView", iupView);
		}
		else if(submit.equals("2")) {
			List iupInsert = iupViewService.setText(itemNumber);
			mav = new ModelAndView(viewName);
			mav.addObject("iupInsert",iupInsert);
			System.out.println("Ȯ��" + iupInsert.size());
			int inputNo = iupViewService.inputNo();
			String inNo = Integer.toString(inputNo+1);
			System.out.println(inNo);
			request.setAttribute("inputNo", inNo);
		}
		return mav;
	}
	
	@RequestMapping(value="/member/iupcodehelper1.do" ,method = RequestMethod.GET)
	public ModelAndView iupCodeHelper1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List itemView = iupViewService.popView1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemView", itemView);
		return mav;
	}
	
	@RequestMapping(value="/member/iupcodehelper2.do" ,method =RequestMethod.GET)
	public ModelAndView iupCodeHelper2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String itemNumber = (String)request.getParameter("itemNumber");
		List itemView = iupViewService.popView2();
		ModelAndView mav = new ModelAndView(viewName); 
		mav.addObject("itemView", itemView); 
		return mav;
	}
	 
	@Override
	@RequestMapping(value="/member/addIup.do" ,method = RequestMethod.GET)
	public ModelAndView iupAddMember(@ModelAttribute("iup") iupVO iupVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = iupViewService.addIup(iupVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/delIup.do" ,method = RequestMethod.GET)
	public ModelAndView iupDelMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String itemNumber = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = itemNumber.split(",");
		iupViewService.delIup(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/itemunitprice.do");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/member/updateIup.do" ,method = RequestMethod.GET)
	public ModelAndView iupUpdateMember(@ModelAttribute("iup") iupVO iupVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8"); 
		int result = 0; 
		result = iupViewService.updateIup(iupVO);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/itemunitprice.do");
		return mav; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchIupName.do", method = RequestMethod.GET)
	public ModelAndView searchPopName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<iupVO> popName = null;
		popName = iupViewService.searchPopName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/member/searchIupName2.do", method = RequestMethod.GET)
	public ModelAndView searchPopName2(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<iupVO> popName = null;
		popName = iupViewService.searchPopName2(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

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

}