package com.myspring.outsourcing_manage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.outsourcing_manage.service.RegOutsourcingService;
import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;
import com.myspring.outsourcing_manage.OutRelease.vo.OutReleaseVO;

@Controller("RegOutsourcingController")
public class RegOutsourcingControllerImpl implements RegOutsourcingController {
private static final Logger logger = LoggerFactory.getLogger(RegOutsourcingControllerImpl.class);
	
	@Autowired
	private RegOutsourcingService regOutsourcingService;
	@Autowired
	private RegOutsourcingVO regOutsourcingVO;
	@Autowired
	private ComOutsourcingVO comOutsourcingVO;
	@Autowired
	private OutReleaseVO outReleaseVO;
	

	@Override
	@RequestMapping(value="/member/regoutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView listOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		List outsourcingView = regOutsourcingService.listOutsourcing();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("outsourcingView", outsourcingView);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/comoutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView listComOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		List comOutsourcingView = regOutsourcingService.listComOutsourcing();
		List comOutsourcingViewDetail = regOutsourcingService.listComOutsourcingDetail();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("comOutsourcingView", comOutsourcingView);
		mav.addObject("comOutsourcingViewDetail", comOutsourcingViewDetail);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/outrelease.do" ,method = RequestMethod.GET)
	public ModelAndView listOutRelease(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		List outReleaseView = regOutsourcingService.listOutRelease();
		List outReleaseViewDetail = regOutsourcingService.listOutReleaseDetail();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("outReleaseView", outReleaseView);
		mav.addObject("outReleaseViewDetail", outReleaseViewDetail);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/regoutper.do" ,method = RequestMethod.GET)
	public ModelAndView listRegOutPerformance(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		List regOutPerformanceView = regOutsourcingService.listRegOutPerformance();
		List regOutPerformanceViewDetail = regOutsourcingService.listRegOutPerformanceDetail();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("regOutPerformanceView", regOutPerformanceView);
		mav.addObject("regOutPerformanceViewDetail", regOutPerformanceViewDetail);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addOutrelease.do" ,method = RequestMethod.GET)
	public ModelAndView addOutrelease(@ModelAttribute("outRelease") RegOutsourcingVO regOutsourcingVO,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = regOutsourcingService.addOutRelease(outReleaseVO);
		int result1 = 0;
		result1 = regOutsourcingService.addOutReleaseDetail(outReleaseVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	
	@Override
	  @RequestMapping(value="/member/productionPlanSearchOut.do",method = RequestMethod.GET)
	  	public ModelAndView productionPlanSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  String viewName = getViewName(request);
		  ModelAndView mav = new ModelAndView(viewName);
		  return mav;
	  }
	  
	  @Override
	  @RequestMapping(value="/member/productionPlanResponseOut.do",method = RequestMethod.GET)
	  	public ModelAndView productionPlanResposne(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  String startDate = request.getParameter("dateStart");
		  String endDate = request.getParameter("dateEnd");
		  String viewName = getViewName(request);
		  List productionPlanView = regOutsourcingService.productionPlanView(startDate, endDate);
		  ModelAndView mav = new ModelAndView(viewName);
		  mav.addObject("productionPlanView", productionPlanView);
		  return mav;
	  }

	@Override
	@RequestMapping(value="/member/addOutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView addOutsourcing(@ModelAttribute("out") RegOutsourcingVO regOutsourcingVO,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = regOutsourcingService.addOutsourcing(regOutsourcingVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/removeOutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView removeOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String number = (String) request.getParameter("workOrderNumber");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");
		regOutsourcingService.removeOutsourcing(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regoutsourcing.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updateOutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView updateOutsourcing(@ModelAttribute("out") RegOutsourcingVO regOutsourcingVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = regOutsourcingService.updateOutsourcing(regOutsourcingVO);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/regoutsourcing.do");
		return mav;
	}
		
	@Override
	@RequestMapping(value="/member/updateComOutsourcing.do" ,method = RequestMethod.GET)
	public ModelAndView updateComOutsourcing(@ModelAttribute("comOut") ComOutsourcingVO comOutsourcingVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = regOutsourcingService.updateComOutsourcing(comOutsourcingVO);
		System.out.println("result "+result);
		ModelAndView mav = new ModelAndView("redirect:/member/comoutsourcing.do");
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
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}

	
}
