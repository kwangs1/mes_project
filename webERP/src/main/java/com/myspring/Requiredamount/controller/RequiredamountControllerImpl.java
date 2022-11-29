package com.myspring.Requiredamount.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.Requiredamount.service.RequiredamountService;
import com.myspring.Requiredamount.vo.RequiredamountVO;
import com.myspring.order_closing.vo.OrderClosingVO;

@Controller("mrpController")
public class RequiredamountControllerImpl implements RequiredamountController{
	@Autowired
	private RequiredamountService mrpService;
	@Autowired
	private RequiredamountVO mrpVO;
	
	@Override
	@RequestMapping(value="member/requiredamount.do", method = RequestMethod.GET)
	public ModelAndView mrpList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String viewName = (String)request.getAttribute("viewName");
		List mrpList = mrpService.selectAllMrpList(startDate, endDate);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("mrpList", mrpList);
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
