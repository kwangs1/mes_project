package com.myspring.invenBasicInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.invenBasicInfo.regItemUnitPrice.vo.*;
import org.springframework.web.bind.annotation.ResponseBody;

public interface IupViewController {
	public ModelAndView viewIup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView iupAddMember(@ModelAttribute("iup") iupVO iupVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView iupDelMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView iupUpdateMember(@ModelAttribute("iup") iupVO iupVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}