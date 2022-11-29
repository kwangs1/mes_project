package com.myspring.systemmag.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;

public interface SystemmagControllerMJ {
	public ModelAndView addCustomer (@ModelAttribute("company") SystemmagVOMJ company,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updateCustomer(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	public ModelAndView popupCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView popupZipCustomer(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	 
	
	
	public ModelAndView viewOutware(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView popupOutware1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView popupOutware2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView popupOutware3(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	
	public ModelAndView viewLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addLogistics(@ModelAttribute("logis") SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updateLogistics(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView popupLogistics(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	
	public ModelAndView addInspection (@ModelAttribute("ins") SystemmagVOMJ company,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewInspection(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteInspection(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updateInspection(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	

	
	public ModelAndView addSetComponents (@ModelAttribute("Set") SystemmagVOMJ company,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updateSetComponents(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	public ModelAndView popupSetComponents(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addSpecComponents (@ModelAttribute("Set") SystemmagVOMJ company,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView searchPopCompoItemName(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteSpecComponents(SystemmagVOMJ systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewPopupSet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewPopupSpec(HttpServletRequest request, HttpServletResponse response) throws Exception;
			
}
