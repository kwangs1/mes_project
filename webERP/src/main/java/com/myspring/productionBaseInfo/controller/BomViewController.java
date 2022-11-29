package com.myspring.productionBaseInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myspring.productionBaseInfo.BOM.vo.RegOutSourcingPriceVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.productionBaseInfo.regDefectiveType.vo.DefectiveTypeVO;
public interface BomViewController {
	public ModelAndView viewBOM(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("bom") bomVO bomVO,HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView delMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateMember(@ModelAttribute("bom") bomVO bomVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView rightbom(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reservebom(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView regoutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addoutprice(@ModelAttribute("out") RegOutSourcingPriceVO outVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updoutprice(@ModelAttribute("out") RegOutSourcingPriceVO outVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteoutprice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewDefectiveType(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adddefType(@ModelAttribute("def") DefectiveTypeVO defVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView upddefType(@ModelAttribute("def") DefectiveTypeVO defVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deldefType(@ModelAttribute("def") DefectiveTypeVO defVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deldefPop(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adddefpop(@ModelAttribute("def") DefectiveTypeVO defVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
}