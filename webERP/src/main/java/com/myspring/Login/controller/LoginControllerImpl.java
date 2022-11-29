package com.myspring.Login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.Login.service.LoginService;
import com.myspring.Login.vo.LoginVO;
import com.myspring.invenBasicInfo.controller.IupViewControllerImpl;

@Controller("memberLoginController")

public class LoginControllerImpl implements LoginController{
	private static final Logger logger = LoggerFactory.getLogger(IupViewControllerImpl.class);
	@Autowired
	private LoginService loginService;
	@Autowired
	private LoginVO loginVO;
	
	@Override
	@RequestMapping(value="/member/login.do" ,method = RequestMethod.GET)
	public ModelAndView ViewLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/depcodepop.do" ,method = RequestMethod.GET)
	public ModelAndView ViewdepPop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List depView = loginService.depView();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("depView", depView);
		return mav;
	}	
	
	@RequestMapping(value="/member/empcodepop.do" ,method = RequestMethod.GET)
	public ModelAndView ViewempPop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String depCode = (String) request.getParameter("depCode");
		if(depCode == null || depCode.length() == 0) {
			return null;
		}
		List empView = loginService.empView(depCode);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("empView", empView);
		return mav;
	}
	@Override
	@RequestMapping(value="/member/doLogin.do" ,method = RequestMethod.GET)
	public ModelAndView doLogin(LoginVO vo, HttpServletRequest request, HttpServletResponse response,RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = null;
		loginVO = loginService.login(vo);
		if(loginVO == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			mav = new ModelAndView("redirect:/member/loginfailed.do");
		}else {
			session.setAttribute("dep_name", loginVO.getDep_Name());
			session.setAttribute("emp_name", loginVO.getEmp_Name());
			session.setAttribute("emp_code", loginVO.getEmp_Code());
			session.setAttribute("dep_code", loginVO.getDep_Code());
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}
	@Override
	@RequestMapping(value="/member/logout.do" ,method = RequestMethod.GET)
	public ModelAndView doLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
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
