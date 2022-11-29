package com.myspring.outsourcing_manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.outsourcing_manage.ComOutsourcing.vo.ComOutsourcingVO;
import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

public interface RegOutsourcingController {
	public ModelAndView listOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addOutsourcing(@ModelAttribute("info") RegOutsourcingVO regOutsourcingVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView productionPlanResposne(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView productionPlanSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listComOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public  ModelAndView updateOutsourcing(RegOutsourcingVO regOutsourcingVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView updateComOutsourcing(ComOutsourcingVO comOutsourcingVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView listOutRelease(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addOutrelease(RegOutsourcingVO regOutsourcingVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView listRegOutPerformance(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}