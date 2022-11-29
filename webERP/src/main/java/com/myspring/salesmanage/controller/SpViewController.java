package com.myspring.salesmanage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.invenBasicInfo.regItemUnitPrice.vo.iupVO;
import com.myspring.salesmanage.salesplan.vo.spVO;
import org.springframework.web.bind.annotation.ResponseBody;

public interface SpViewController {
	public ModelAndView viewSp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView spAddMember(@ModelAttribute("sp") spVO spVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView spDelMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView spUpdateMember(@ModelAttribute("sp") spVO spVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
