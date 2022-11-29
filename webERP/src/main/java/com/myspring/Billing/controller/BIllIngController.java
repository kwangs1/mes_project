package com.myspring.Billing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.myspring.Billing.vo.BIllIngVO;

public interface BIllIngController {

	ModelAndView cmList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView mrpamount(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView delbilling(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView updatebilling(BIllIngVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView addbilling(BIllIngVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
