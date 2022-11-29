package com.myspring.Billing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.Billing.service.BIllIngService;
import com.myspring.Billing.vo.BIllIngVO;
import com.myspring.MainPlan.vo.MainPlanVO;

@Controller("billingController")
public class BIllIngControllerImpl implements BIllIngController{
	@Autowired
	private BIllIngService billingService;
	@Autowired
	private BIllIngVO billingVO;
	
	@Override
	@RequestMapping(value="member/regbilling.do", method = RequestMethod.GET)
	public ModelAndView cmList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String viewName = (String)request.getAttribute("viewName");
		List cmList = billingService.selectAllcmList(startDate, endDate);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("cmList", cmList);	
		return mav;
	}
	@Override
	@RequestMapping(value="member/mrpamount.do", method=RequestMethod.GET)
	public ModelAndView mrpamount(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List mrpamount = billingService.selectAllMrpaMount();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("mrpamount", mrpamount);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/delbilling.do", method = RequestMethod.GET)
	public ModelAndView delbilling(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = (String) request.getParameter("sequence");
		String viewName = getViewName(request);
		String[] numberary  = no.split(",");
		billingService.delbilling(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regbilling.do");
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/member/updatebilling.do" ,method = RequestMethod.GET)
	public ModelAndView updatebilling(@ModelAttribute("cm") BIllIngVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = billingService.updatebilling(vo);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/regbilling.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/addbilling.do", method = RequestMethod.GET)
	public ModelAndView addbilling(@ModelAttribute("bottomList") BIllIngVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = billingService.addbilling(vo);
		ModelAndView mav = new ModelAndView("redirect:" + path);
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
