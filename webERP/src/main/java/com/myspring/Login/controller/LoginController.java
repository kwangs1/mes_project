package com.myspring.Login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.Login.vo.LoginVO;

public interface LoginController {
	public ModelAndView ViewLogin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView doLogin(LoginVO vo, HttpServletRequest request, HttpServletResponse response ,RedirectAttributes rttr) throws Exception;
	public ModelAndView doLogout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
