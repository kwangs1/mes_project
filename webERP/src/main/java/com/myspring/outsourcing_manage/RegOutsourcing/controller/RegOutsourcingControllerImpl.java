//package com.myspring.outsourcing_manage.RegOutsourcing.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.EnableAspectJAutoProxy;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.myspring.outsourcing_manage.RegOutsourcing.service.RegOutsourcingService;
//import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;
//
//@Controller("RegOutsourcingController")
//public class RegOutsourcingControllerImpl implements RegOutsourcingController {
//private static final Logger logger = LoggerFactory.getLogger(RegOutsourcingControllerImpl.class);
//	
//	@Autowired
//	private RegOutsourcingService regOutsourcingService;
//	@Autowired
//	private RegOutsourcingVO regOutsourcingVO;
//	
//
//	@Override
//	@RequestMapping(value="/member/regoutsourcing.do" ,method = RequestMethod.GET)
//	public ModelAndView listOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		String viewName = getViewName(request);
//		List outsourcingView = regOutsourcingService.listOutsourcing();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("outsourcingView", outsourcingView);
//		return mav;
//	}
//
//	@Override
//	@RequestMapping(value="/member/addOutsourcing.do" ,method = RequestMethod.POST)
//	public ModelAndView addOutsourcing(@ModelAttribute("regOutsourcingVO") RegOutsourcingVO regOutsourcingVO,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		int result = 0;
//		result = regOutsourcingService.addOutsourcing(regOutsourcingVO);
//		ModelAndView mav = new ModelAndView("redirect:/member/regoutsourcing.do");
//		return mav;
//	}
//	
//	@Override
//	@RequestMapping(value="/member/removeOutsourcing.do" ,method = RequestMethod.GET)
//	public ModelAndView removeOutsourcing(@RequestParam("workOrderNumber") int workOrderNumber, HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		regOutsourcingService.removeOutsourcing(workOrderNumber);
//		ModelAndView mav = new ModelAndView("redirect:/member/removeOutsourcing.do");
//		return mav;
//	}
//
//
//	private String getViewName(HttpServletRequest request) throws Exception {
//		String contextPath = request.getContextPath();
//		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
//		if (uri == null || uri.trim().equals("")) {
//			uri = request.getRequestURI();
//		}
//
//		int begin = 0;
//		if (!((contextPath == null) || ("".equals(contextPath)))) {
//			begin = contextPath.length();
//		}
//
//		int end;
//		if (uri.indexOf(";") != -1) {
//			end = uri.indexOf(";");
//		} else if (uri.indexOf("?") != -1) {
//			end = uri.indexOf("?");
//		} else {
//			end = uri.length();
//		}
//
//		String viewName = uri.substring(begin, end);
//		if (viewName.indexOf(".") != -1) {
//			viewName = viewName.substring(0, viewName.lastIndexOf("."));
//		}
//		if (viewName.lastIndexOf("/") != -1) {
//			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
//		}
//		return viewName;
//	}
//
//	
//}
