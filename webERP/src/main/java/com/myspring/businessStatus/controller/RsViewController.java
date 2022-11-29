package com.myspring.businessStatus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.businessStatus.releaseStatus.vo.*;
import org.springframework.web.bind.annotation.ResponseBody;

public interface RsViewController {
	public ModelAndView viewRs(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
