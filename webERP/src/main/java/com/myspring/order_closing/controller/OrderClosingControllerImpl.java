package com.myspring.order_closing.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.MainPlan.controller.MainPlanControllerImpl;
import com.myspring.order_closing.service.OrderClosingService;
import com.myspring.order_closing.vo.OrderClosingVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;
import com.myspring.systemmag.vo.itemVO;

@Controller("orderclosingController")
public class OrderClosingControllerImpl implements OrderClosingController{
	private static final Logger logger = LoggerFactory.getLogger(MainPlanControllerImpl.class);
	@Autowired
	private OrderClosingService orderclosingService;
	@Autowired
	private OrderClosingVO orderclosingVO;
	
	@Override
	@RequestMapping(value = "member/orderclosing.do", method = RequestMethod.GET)
	public ModelAndView ClosingList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String viewName = (String) request.getAttribute("viewName");
		List ClosingList = orderclosingService.selectAllClosingList(startDate, endDate);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("ClosingList", ClosingList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updateOrderClosing.do" ,method = RequestMethod.GET)
	public ModelAndView updateOrderClosing(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String no = (String) request.getParameter("sequence");
		String viewName = getViewName(request);
		String[] numberary  = no.split(",");
		orderclosingService.updateOrderClosing(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/orderclosing.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/delClosing.do", method = RequestMethod.GET)
	public ModelAndView delClosing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = (String) request.getParameter("sequence");
		String viewName = getViewName(request);
		String[] numberary  = no.split(",");
		orderclosingService.delClosing(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/orderclosing.do");
		return mav;
	}	

	@Override
	@RequestMapping(value = "/member/addClosing.do", method = RequestMethod.GET)
	public ModelAndView addClosing(@ModelAttribute("ClosingList") OrderClosingVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = orderclosingService.addClosing(vo);
		ModelAndView mav = new ModelAndView("redirect:" + path);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updateClosing.do" ,method = RequestMethod.GET)
	public ModelAndView updateMPS(@ModelAttribute("ClosingList") OrderClosingVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = orderclosingService.updateClosing(vo);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/orderclosing.do");
		return mav;
	}
	
	@RequestMapping(value = "member/itemPop.do", method = RequestMethod.GET)
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List itemList = orderclosingService.itemList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemList", itemList);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/NameSearch.do", method = RequestMethod.GET)
	public ModelAndView NameSearch(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<itemVO> popName = null;
		popName = orderclosingService.NameSearch(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	
	@RequestMapping(value = "member/buyerPop.do", method = RequestMethod.GET)
	public ModelAndView buyerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List buyerList = orderclosingService.buyerList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("buyerList", buyerList);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/buyerSearch.do", method = RequestMethod.GET)
	public ModelAndView buyerSearch(@RequestParam("buyer") String buyer) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
		popName = orderclosingService.buyerSearch(buyer);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");
		
		return mav;
	} 

	
	private String getViewName(HttpServletRequest request) throws Exception {
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
