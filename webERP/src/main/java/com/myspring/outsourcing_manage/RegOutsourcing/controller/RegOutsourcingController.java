package com.myspring.outsourcing_manage.RegOutsourcing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.outsourcing_manage.RegOutsourcing.vo.RegOutsourcingVO;

public interface RegOutsourcingController {
	public ModelAndView listOutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addOutsourcing(@ModelAttribute("info") RegOutsourcingVO regOutsourcingVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeOutsourcing(@RequestParam("workOrderNumber") int workOrderNumber, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}