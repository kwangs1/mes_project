package com.myspring.productionBaseInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.productionBaseInfo.service.*;
import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.productionBaseInfo.BOM.vo.*;
import com.myspring.productionBaseInfo.regDefectiveType.vo.DefectiveTypeVO;



@Controller("memberController")
//@EnableAspectJAutoProxy
public class BomViewControllerImpl implements BomViewController {
	private static final Logger logger = LoggerFactory.getLogger(BomViewControllerImpl.class);
	@Autowired
	private BomViewService viewService;
	@Autowired
	private bomVO bomVO ;
	
	@Override
	@RequestMapping(value="/member/regbom.do" ,method = RequestMethod.GET)
	public ModelAndView viewBOM(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String number = (String) request.getParameter("itemNumber");
		String submit = (String) request.getParameter("submit");
		String itemNumber = (String) request.getParameter("itemCode");
		int sum = 0;
		if(number == null || number.length() == 0 || submit.equals("0")) {
			mav = new ModelAndView(viewName);
			return mav;
		}
		else if(submit.equals("1")){
			List bomView = viewService.SearchView(number);
			
			mav = new ModelAndView(viewName);
			
			mav.addObject("bomView", bomView);
		}
		else if(submit.equals("2")) {
			List bomView = viewService.SearchView(number);
			List bomInsert = viewService.setText(itemNumber);
			mav = new ModelAndView(viewName);
			mav.addObject("bomView", bomView);
			mav.addObject("bomInsert",bomInsert);
			int inputNo = viewService.inputNo();
			String inNo = Integer.toString(inputNo+1);
			request.setAttribute("inputNo", inNo);
		}
		return mav;
	}
	@RequestMapping(value="/member/codehelper.do" ,method = RequestMethod.GET)
	public ModelAndView codeHelper(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List itemView = viewService.itemView1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemView", itemView);
		return mav;
	}
	@RequestMapping(value="/member/bomcodehelper.do" ,method = RequestMethod.GET)
	public ModelAndView BOMcodeHelper(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String itemNumber = (String) request.getParameter("itemCode");
		List itemView = viewService.itemView2();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemView", itemView);
		return mav;
	}
	@RequestMapping(value="/member/reservePop.do" ,method = RequestMethod.GET)
	public ModelAndView BOMreserveHelper(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String itemNumber = (String) request.getParameter("itemCode");
		List itemView = viewService.itemView2();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemView", itemView);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addBOM.do" ,method = RequestMethod.GET)
	public ModelAndView addMember(@ModelAttribute("bom") bomVO bomVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.addBOM(bomVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/delBOM.do" ,method = RequestMethod.GET,produces="text/plain; charset=UTF-8")
	public ModelAndView delMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String iNumber = (String) request.getParameter("itemNumber");
		String name = (String) request.getParameter("itemName");
		String number = (String) request.getParameter("no");
		System.out.println(name);
		String viewName = getViewName(request);
		String[] numberary = number.split(",");
		viewService.delBOM(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regbom.do?itemNumber="+iNumber+"&&itemName="+name+"&&submit=1");
		return mav;
		}
	@RequestMapping(value="/member/updateBOM.do" ,method = RequestMethod.GET)
	public ModelAndView updateMember(@ModelAttribute("bom") bomVO bomVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.updateBOM(bomVO);
		ModelAndView mav = new ModelAndView("redirect:" + path);
		return mav;
	}
	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

	@Override
	@RequestMapping(value="/member/rightbom.do" ,method = RequestMethod.GET)
	public ModelAndView rightbom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String number = (String) request.getParameter("itemNumber");
		String submit = (String) request.getParameter("submit");
		String childCode = (String) request.getParameter("childCode");
		int sum = 0;
		if(number == null || number.length() == 0 || submit.equals("0")) {
			mav = new ModelAndView(viewName);
			return mav;
		}
		else if(submit.equals("1")){
			List bomView = viewService.SearchView(number);
			
			mav = new ModelAndView(viewName);
			
			mav.addObject("bomView", bomView);
		}
		return mav;
	}
	@Override
	@RequestMapping(value="/member/reservebom.do" ,method = RequestMethod.GET)
	public ModelAndView reservebom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String number = (String) request.getParameter("itemNumber");
		String submit = (String) request.getParameter("submit");
		String childCode = (String) request.getParameter("childCode");
		int sum = 0;
		if(number == null || number.length() == 0 || submit.equals("0")) {
			mav = new ModelAndView(viewName);
			return mav;
		}
		else if(submit.equals("1")){
			List bomView = viewService.ResearveView(number);
			
			mav = new ModelAndView(viewName);
			
			mav.addObject("bomView", bomView);
		}

		return mav;
	}
	@Override
	@RequestMapping(value="/member/outprice.do" ,method = RequestMethod.GET)
	public ModelAndView regoutsourcing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String itemNumber = request.getParameter("itemNumber");
		String submit = request.getParameter("submit");
		String itemCode = request.getParameter("itemCode");
		String placeCode = request.getParameter("placeCode");
		mav = new ModelAndView(viewName);
		if(itemNumber == null || submit == null || submit.equals("0")) {
			return mav;
		}
		else if(submit.equals("1")) {
			List outpriceView = viewService.getoutprice(itemNumber,placeCode);
			mav.addObject("outpriceView",outpriceView);
		}
		else if(submit.equals("2")) {
			List outpriceView = viewService.getoutprice(itemNumber,placeCode);
			List outpriceText = viewService.inputText(itemCode);
			mav.addObject("outpriceView",outpriceView);
			mav.addObject("setText",outpriceText);
		}
		return mav;
	}
	@RequestMapping(value="/member/outsourcingPop.do" ,method = RequestMethod.GET)
	public ModelAndView outsourcingPop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String div = request.getParameter("div");
		String viewName = getViewName(request);
		String itemNumber = request.getParameter("itemNumber");
		
		mav = new ModelAndView(viewName);
		if(itemNumber == null || div.equals("1")) {
			List outView = viewService.SearchOutView();
			mav.addObject("outView",outView);
		}
		else if(div.equals("2")) {
			List outView = viewService.SearchOutView1(itemNumber);
			
			mav.addObject("outView",outView);
		}

		return mav;
	}
	@RequestMapping(value="/member/outpricehelper.do" ,method = RequestMethod.GET)
	public ModelAndView outpriceHelper(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		List bomlist = viewService.bomView();
		mav.addObject("bomlist",bomlist);
		return mav;
	}
	@ResponseBody
	@RequestMapping(value = "/member/searchoutPop.do", method = RequestMethod.GET)
	public ModelAndView searchPopName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<bomVO> popName = null;
		popName = viewService.searchPopName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	@ResponseBody
	@RequestMapping(value = "/member/searchbom1.do", method = RequestMethod.GET)
	public ModelAndView searchbomPop1(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<bomVO> popName = null;
		popName = viewService.searchbomPop1(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	@ResponseBody
	@RequestMapping(value = "/member/searchbom2.do", method = RequestMethod.GET)
	public ModelAndView searchbomPop2(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<bomVO> popName = null;
		popName = viewService.searchbomPop2(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	@Override
	@RequestMapping(value="/member/addoutprice.do" ,method = RequestMethod.GET)
	public ModelAndView addoutprice(@ModelAttribute("out") RegOutSourcingPriceVO outVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.addoutprice(outVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/member/updoutprice.do" ,method = RequestMethod.GET)
	public ModelAndView updoutprice(@ModelAttribute("out") RegOutSourcingPriceVO outVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.updoutprice(outVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/deleteoutprice.do" ,method = RequestMethod.GET)
	public ModelAndView deleteoutprice(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int result = 0;
		request.setCharacterEncoding("utf-8");
		String place = request.getParameter("place");
		String code = request.getParameter("out");
		String number = (String) request.getParameter("no");
		String[] numberary = number.split(",");
		RegOutSourcingPriceVO outVO = new RegOutSourcingPriceVO();
		List<RegOutSourcingPriceVO> outVO1= new ArrayList<RegOutSourcingPriceVO>();
		for(int i = 0;i<numberary.length;i++) {
			outVO1.add(i,outVO);
			outVO1.get(i).setOutcustomer(place);
			outVO1.get(i).setOutsourcing_Code(code);
			outVO1.get(i).setItem_code(numberary[i]);
		}
		result = viewService.doutprice(outVO1);
		ModelAndView mav = new ModelAndView("redirect:/member/outprice.do?itemNumber="+code+"&&placeCode="+place+"&&submit=1");
		return mav;
	}

	@Override
	@RequestMapping(value="/member/deftype.do" ,method = RequestMethod.GET)
	public ModelAndView viewDefectiveType(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		mav = new ModelAndView(viewName);
		String submit = (String) request.getParameter("submit");
		String defGroupCode = (String) request.getParameter("defGroupCode");
		int sum = 0;
		if(defGroupCode == null && submit == null || submit.equals("0")) {
			mav = new ModelAndView(viewName);
			return mav;
		}
		else if(submit.equals("1")){
			List defectiveList = null;
			defectiveList =  viewService.viewDefective(defGroupCode);
			mav.addObject("defectiveList",defectiveList);
		}
		else if(submit.equals("2")) {
			List defectiveList = null;
			defectiveList =  viewService.viewDefective(defGroupCode);
			mav.addObject("defectiveList",defectiveList);
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/member/adddefType.do" ,method = RequestMethod.GET)
	public ModelAndView adddefType(DefectiveTypeVO defVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.addDefType(defVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/upddefType.do" ,method = RequestMethod.GET)
	public ModelAndView upddefType(DefectiveTypeVO defVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.updDefType(defVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	@RequestMapping(value="/member/deftypepop.do" ,method = RequestMethod.GET)
	public ModelAndView defTypePop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		List defGroupList = viewService.viewGroupList();
		mav.addObject("defGroupList",defGroupList);
		return mav;
	}
	@Override
	@RequestMapping(value="/member/deldefType.do" ,method = RequestMethod.GET)
	public ModelAndView deldefType(DefectiveTypeVO defVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String number = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");
		viewService.deldefType(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/deftype.do");
		return mav;
	}
	@Override
	@RequestMapping(value="/member/adddefpop.do" ,method = RequestMethod.GET)
	public ModelAndView adddefpop(DefectiveTypeVO defVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		int result = 0;
		result = viewService.addDefpop(defVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	@Override
	@RequestMapping(value="/member/deldefPop.do" ,method = RequestMethod.GET)
	public ModelAndView deldefPop(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String number = (String) request.getParameter("no");
		String viewName = getViewName(request);
		String[] numberary = number.split(",");
		viewService.deldefPop(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/deftypepop.do");
		return mav;
	}
	
}
