package com.myspring.salesmanage.forward.reg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.salesmanage.cor.vo.CorVO;
import com.myspring.salesmanage.forward.vo.ForwardVO;

public interface ForwardRegController {

	public ModelAndView submitCust(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listForwardCode(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addForward(@ModelAttribute("forward") ForwardVO forwardVO, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView delForward(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView itemTableView(@RequestParam("relCode")String relCode) throws Exception;

	public ModelAndView addForwardItem(@ModelAttribute("cor")CorVO corVO, HttpServletRequest request,HttpServletResponse response) throws Exception;
////	public ModelAndView listSubForwardCode(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView delForwardItem(HttpServletRequest request, HttpServletResponse response) throws Exception ;
}
