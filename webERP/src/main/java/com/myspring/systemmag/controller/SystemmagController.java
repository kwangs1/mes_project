package com.myspring.systemmag.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.productionBaseInfo.BOM.vo.bomVO;
import com.myspring.systemmag.vo.DepartmentVO;
import com.myspring.systemmag.vo.ItemgVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.WorkplaceVO;
import com.myspring.systemmag.vo.itemVO;
//회사등록
public interface SystemmagController {
	public ModelAndView addCompany (@ModelAttribute("company") SystemmagVO company,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewCompany(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adressZip(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateCompany(SystemmagVO systemmagVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteCompany(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//사업장등록
	public ModelAndView addWorkplace(@ModelAttribute("workplace") WorkplaceVO workplaceVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewWorkplace(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateWorkplace(WorkplaceVO workplaceVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteWorkplace(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//품목등록
	public ModelAndView addItem (@ModelAttribute("item") itemVO itemVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewItem(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateItem(itemVO itemVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteItem(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//품목군등록
	public ModelAndView addItemg (@ModelAttribute("itemg") ItemgVO itemgVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewItemg(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateItemg(ItemgVO itemgVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteItemg(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//사원조회
	public ModelAndView viewemployee(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//부서등록
	public ModelAndView adddepartment (@ModelAttribute("department") DepartmentVO departmentVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewdepartment(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updatedepartment(DepartmentVO departmentVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deletedepartment(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
