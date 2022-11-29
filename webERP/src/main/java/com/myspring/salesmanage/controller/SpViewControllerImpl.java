package com.myspring.salesmanage.controller;

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

import com.myspring.salesmanage.service.SpViewService;
import com.myspring.invenBasicInfo.regItemUnitPrice.vo.iupVO;
import com.myspring.salesmanage.salesplan.vo.spVO;

@Controller
//@EnableAspectJAutoProxy

public class SpViewControllerImpl implements SpViewController {
	private static final Logger logger = LoggerFactory.getLogger(SpViewControllerImpl.class);
	@Autowired
	private SpViewService spViewService;
	@Autowired
	private spVO spVO;
	
	@Override
	@RequestMapping(value="/member/regsalesplan.do" ,method = RequestMethod.GET)
	public ModelAndView viewSp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String itemCode = (String) request.getParameter("itemCode");
		String submit = (String) request.getParameter("submit");
		int sum = 0;
		System.out.println(submit);
		if(itemCode == null||itemCode.length() ==0 || submit.equals("0")) {
			List spView = spViewService.spView();
			mav = new ModelAndView(viewName);
			mav.addObject("spView", spView);
		}
		else if(submit.equals("1")){
			List spView = spViewService.SearchView(itemCode);
			mav = new ModelAndView(viewName);
			mav.addObject("spView", spView);
		}
		else if(submit.equals("2")) {
			List spInsert = spViewService.setText(itemCode);
			mav = new ModelAndView(viewName);
			mav.addObject("spInsert",spInsert);
			System.out.println("" + spInsert.size());
		}
		return mav;
	}
	
	@RequestMapping(value="/member/spcodehelper1.do" ,method = RequestMethod.GET)
	public ModelAndView spCodeHelper1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List itemView = spViewService.popView1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemView", itemView);
		return mav;
	}
	
	@RequestMapping(value="/member/spcodehelper2.do" ,method =RequestMethod.GET)
	public ModelAndView spCodeHelper2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String itemCode = (String)request.getParameter("itemCode");
		List itemView = spViewService.popView2();
		ModelAndView mav = new ModelAndView(viewName); 
		mav.addObject("itemView", itemView); 
		return mav;
	}
	 
	@Override
	@RequestMapping(value="/member/addSp.do" ,method = RequestMethod.GET)
	public ModelAndView spAddMember(@ModelAttribute("sp") spVO spVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = spViewService.addSp(spVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/delSp.do" ,method = RequestMethod.GET)
	public ModelAndView spDelMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String itemCode = request.getParameter("itemCode");
		String viewName = getViewName(request);
		String[] numberary = itemCode.split(",");
		spViewService.delSp(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regsalesplan.do");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/member/updateSp.do" ,method = RequestMethod.GET)
	public ModelAndView spUpdateMember(@ModelAttribute("sp") spVO spVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8"); 
		int result = 0; 
		result = spViewService.updateSp(spVO);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/regsalesplan.do");
		return mav; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchSpName.do", method = RequestMethod.GET)
	public ModelAndView searchPopName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<spVO> popName = null;
		popName = spViewService.searchPopName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/member/searchSpName2.do", method = RequestMethod.GET)
	public ModelAndView searchPopName2(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<spVO> popName = null;
		popName = spViewService.searchPopName2(itemName);
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
