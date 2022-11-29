package com.myspring.StockManage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.StockManage.service.StockManageService;
import com.myspring.StockManage.vo.StockManageVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;

@Controller("StockManageController")
public class StockManageControllerImpl implements StockManageController {
	@Autowired
	StockManageService stockManageservice;
	@Autowired
	StockManageVO stockVO;
	@Autowired
	SqlSession sqlSession;
	@RequestMapping(value = "/member/curinvenstat.do", method = RequestMethod.GET)
	public ModelAndView stockstatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		mav = new ModelAndView(viewName);
		String type = request.getParameter("type_name");
		String submit = request.getParameter("submit");
		
		StockManageVO searchVO = new StockManageVO();
		
			
		
		if (StringUtils.hasText(type)) {

			List<StockManageVO> stockList = null;
			stockList = stockManageservice.SearchStock(type);

			mav.addObject("stockList", stockList);
		}else {
			List<StockManageVO> stockList = null;
			stockList = stockManageservice.SearchStockAll();
			mav.addObject("stockList", stockList);
		}
		
		return mav;
		}
	@RequestMapping(value = "/member/curfinishedinvenstat.do", method = RequestMethod.GET)
	public ModelAndView finishedstockstatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		mav = new ModelAndView(viewName);
		String name = request.getParameter("type_name");
		String submit = request.getParameter("submit");
		
		StockManageVO searchVO = new StockManageVO();
		
		
			if (StringUtils.hasText(name)) {

				List<StockManageVO> stockList = null;
				stockList = stockManageservice.SearchfinishedStock(name);

				mav.addObject("stockList", stockList);
			}else {
				List<StockManageVO> stockList = null;
				stockList = stockManageservice.SearchfinishedStockAll();
				mav.addObject("stockList", stockList);
			}
		
		
		return mav;
		}
	
	@RequestMapping(value = "/member/searchtype.do", method = RequestMethod.GET)
	public ModelAndView searchtype(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List nameView = stockManageservice.nameView();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("nameView", nameView);

		return mav;
	}
	@RequestMapping(value = "/member/finishedsearchtype.do", method = RequestMethod.GET)
	public ModelAndView finishedsearchtype(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List nameView = stockManageservice.finishednameView();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("nameView", nameView);

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopName.do", method = RequestMethod.GET)
	public ModelAndView searchPopName(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<StockManageVO> popName = null;
		popName = stockManageservice.searchPopName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopName2.do", method = RequestMethod.GET)
	public ModelAndView searchPopName2(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<StockManageVO> popName = null;
		popName = stockManageservice.searchPopName2(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	} 
	
	//수주등록
	
	@RequestMapping(value = "/member/regorder.do", method = RequestMethod.GET)
	public ModelAndView viewStock(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		mav = new ModelAndView(viewName);

		String general_Customer_Code = request.getParameter("bus_code");


		StockManageVO searchVO = new StockManageVO();

		if (StringUtils.hasText(general_Customer_Code)) {
			searchVO.setGeneral_Customer_Code(general_Customer_Code);

			List<StockManageVO> customerList = null;
			customerList = stockManageservice.Searchsuju(general_Customer_Code);

			mav.addObject("customerList", customerList);
			mav.addObject("bus_code", general_Customer_Code);
		}



		return mav;
	}
	
	
	@RequestMapping(value = "/member/searchcus.do", method = RequestMethod.GET)
	public ModelAndView searchcus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List nameView = stockManageservice.cusView();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("nameView", nameView);

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchsujusub.do", method = RequestMethod.GET)
	public ModelAndView searchsujusub(@RequestParam("ordersNum") String ordersNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<StockManageVO> sujusub = null;
		sujusub = stockManageservice.sujusub(ordersNum);
		mav.addObject("sujusub", sujusub);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopCus.do", method = RequestMethod.GET)
	public ModelAndView searchPopCus(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<StockManageVO> popName = null;
		popName = stockManageservice.searchPopCus(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@RequestMapping(value = "/member/delsuju.do", method = RequestMethod.GET)
	public ModelAndView delsuju(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = request.getParameter("no");
		String[] numberary = number.split(",");
		stockManageservice.delsuju(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regorder.do");

		return mav;
	}
	
	@RequestMapping(value = "/member/delsujuSub.do", method = RequestMethod.GET)
	public ModelAndView delsujuSub(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = request.getParameter("no");
		String[] numberary = number.split(",");
		stockManageservice.delsujuSub(numberary);
		ModelAndView mav = new ModelAndView("redirect:/member/regorder.do");

		return mav;
	}
	@RequestMapping(value = "/member/searchitemList1.do", method = RequestMethod.GET)
	public ModelAndView searchitemList1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List nameView = stockManageservice.searchitemList1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("nameView", nameView);

		return mav;
	}
	
	
	@RequestMapping(value = "/member/searchitemList2.do", method = RequestMethod.GET)
	public ModelAndView searchitemList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List nameView = stockManageservice.searchitemList1();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("nameView", nameView);

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/searchPopItem.do", method = RequestMethod.GET)
	public ModelAndView searchPopItem(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<StockManageVO> popName = null;
		popName = stockManageservice.searchPopItem(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	
	/////////////////////////�޴��˻���
	
	@RequestMapping(value="/member/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody ModelAndView  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =stockManageservice.keywordSearch(keyword);
	    mav.addObject("keywordList", keywordList);
		mav.setViewName("jsonView");
			return mav;
	}
	@RequestMapping(value = "/member/searchmenu.do", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord) throws Exception {
		ModelAndView mav = new ModelAndView();
		String urlList = null;
		urlList = stockManageservice.searchMenu(searchWord);
		mav.addObject("urlList", urlList);
		mav.setViewName("redirect:/member"+urlList);

		return mav;
	}
	
	@RequestMapping(value="/member/insertNewRow.do")
	public ModelAndView insertNewRow(StockManageVO stVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		stockManageservice.insertNewRow(stVO);
		
//		stVO.getSujuVO(); stVO.getSubSujuList(); 이 두개 각자 꺼내서 저장
		
		
		
		
		mav.setViewName("redirect:/member/regorder.do?bus_code=" + stVO.getBusCode());

		return mav;
	}
	
	@RequestMapping(value="/member/updateSuju.do")
	public ModelAndView updateSuju(StockManageVO stVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		stockManageservice.updateSuju(stVO);
//		stVO.getStoVO(); stVO.getSubListStoVO(); 이 두개 각자 꺼내서 저장
		 
		
		mav.setViewName("redirect:/member/regorder.do?bus_code=" + stVO.getBusCode());

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

}
