package com.myspring.businessStatus.controller;

import java.sql.Date;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.businessStatus.service.RsViewService;
import com.myspring.businessStatus.releaseStatus.vo.*;

@Controller("rsMemberController")
//@EnalbleAspectJAutoProxy
public class RsViewControllerImpl implements RsViewController {
	private static final Logger logger = LoggerFactory.getLogger(RsViewControllerImpl.class);
	@Autowired
	private RsViewService rsViewService;
	@Autowired
	private rsVO rsVO;
	
	@Override
	@RequestMapping(value="/member/releasestat.do" , method=RequestMethod.GET)
	public ModelAndView viewRs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String submit = (String) request.getParameter("submit");
		if(startDate == null || startDate.length() == 0 || submit.equals("0")) {
			List rsView = rsViewService.rsView();
			mav = new ModelAndView(viewName);
			mav.addObject("rsView",rsView);
		}
		else if(submit.equals("1")) {
			List rsView = rsViewService.searchView(startDate,endDate);
			mav = new ModelAndView(viewName);
			mav.addObject("rsView",rsView);
		}
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		int end;
		if(uri.indexOf(";") !=-1) {
			end = uri.indexOf(";");
		} else if(uri.indexOf("?") !=-1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		String viewName = uri.substring(begin, end);
		if(viewName.indexOf(".") !=-1) {
			viewName = viewName.substring(0,viewName.lastIndexOf("."));
		}
		if(viewName.lastIndexOf("/") !=-1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}
}
