package com.myspring.order_closing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.myspring.order_closing.vo.OrderClosingVO;

public interface OrderClosingController {

	ModelAndView ClosingList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView delClosing(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView addClosing(OrderClosingVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	ModelAndView updateOrderClosing(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView updateMPS(OrderClosingVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
