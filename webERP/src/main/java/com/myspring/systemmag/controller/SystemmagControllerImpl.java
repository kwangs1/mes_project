package com.myspring.systemmag.controller;

import java.util.ArrayList;
import java.util.List;
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

import com.myspring.systemmag.service.SystemmagService;
import com.myspring.systemmag.service.SystemmagServiceMJ;
import com.myspring.systemmag.vo.DepartmentVO;
import com.myspring.systemmag.vo.ItemgVO;
import com.myspring.systemmag.vo.SystemmagVO;
import com.myspring.systemmag.vo.SystemmagVOMJ;
import com.myspring.systemmag.vo.WorkplaceVO;
import com.myspring.systemmag.vo.itemVO;

@Controller("SystemmagController")
public class SystemmagControllerImpl implements SystemmagController{
	@Autowired
	private SystemmagService systemmagService;
	@Autowired
	private SystemmagServiceMJ systemmagServiceMJ;
	@Autowired
	private SystemmagVO systemmagVO;
	@Autowired
	private SystemmagVOMJ systemmagVOMJ;
	//회사등록
	@Override
	@RequestMapping(value="/member/addcompany.do" ,method = RequestMethod.GET)
	public ModelAndView addCompany(@ModelAttribute("company") SystemmagVO systemmagVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = systemmagService.addCom(systemmagVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	//회사등록 조회
	@Override
	@RequestMapping(value="/member/regcompany.do" ,method = RequestMethod.GET)
	public ModelAndView viewCompany(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String number = (String) request.getParameter("itemNumber");
		String zipNumber = (String) request.getParameter("zipCode");
		String submit = (String) request.getParameter("submit");
		String code = (String) request.getParameter("com_code");
		if(code == null && submit == null) {
			List comView = systemmagService.comView();
			mav = new ModelAndView(viewName);
			mav.addObject("comView", comView);
			return mav;
		}
		if(submit.equals("1")) {
			List comView = systemmagService.comView();
			List comcom = systemmagService.comcom(code);
			mav = new ModelAndView(viewName);
			mav.addObject("comView", comView);
			mav.addObject("comcom",comcom);
			
		}
		else if(submit.equals("2")) {
			List comView = systemmagService.comView();
			List comcom = systemmagService.comcom(code);
			List zipView = systemmagService.zipView(number);
			List zipInsert = systemmagService.zipText(zipNumber);
			mav = new ModelAndView(viewName);
			mav.addObject("comView", comView);
			mav.addObject("comcom",comcom);
			mav.addObject("zipView", zipView);
			mav.addObject("zipInsert",zipInsert);
		}
		
		return mav;
	}
	//회사등록(수정)
	@Override
	@RequestMapping(value = "/member/updcompany.do", method = RequestMethod.GET)
	public ModelAndView updateCompany(@ModelAttribute("") SystemmagVO systemmagVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		systemmagService.updCom(systemmagVO);//서비스파트의 업데이트함수에 매개변수로  VO를전달함
		ModelAndView mav = new ModelAndView(
				"redirect:/member/regcompany.do?submit=1&&com_code=" + systemmagVO.getCompany_Code());
		return mav;
	}
	//회사등록(삭제)
	@Override
	@RequestMapping(value = "/member/deletecompany.do", method = RequestMethod.GET)
	public ModelAndView deleteCompany(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = (String) request.getParameter("no"); //체크가된 체크박스의 값들을 가져오는 변수임
		String viewName = getViewName(request);
		String[] numberary = number.split(","); //쉼표를 기준으로 나누어 배열에 저장한다

		systemmagService.delCom(numberary);

		ModelAndView mav = new ModelAndView("redirect:/member/regcompany.do");

		return mav;

	}
	//회사등록(팝업)
	@RequestMapping(value="/member/zippopup.do" ,method = RequestMethod.GET)
	public ModelAndView Compopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String zipNumber = (String) request.getParameter("zipCode");
		List zipView = systemmagService.zipView(zipNumber);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("zipView", zipView);
		return mav;
	}
	
	//사업장등록
	@Override
	@RequestMapping(value="/member/addbusiness.do" ,method = RequestMethod.GET)
	public ModelAndView addWorkplace(@ModelAttribute("workplace") WorkplaceVO workplaceVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getParameter("path");
		path = path.replace("/webERP", "");
		System.out.println("url" + path);
		int result = 0;
		result = systemmagService.addWor(workplaceVO);
		ModelAndView mav = new ModelAndView("redirect:"+path);
		return mav;
	}
	
	//사업장등록(조회)
	@Override
	@RequestMapping(value="/member/regbusiness.do" ,method = RequestMethod.GET)
	public ModelAndView viewWorkplace(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		String viewName = getViewName(request);
		String submit = (String) request.getParameter("submit");
		String code = (String) request.getParameter("wor_code");
		if(code == null || submit == null) {
			List worView = systemmagService.worView();
			mav = new ModelAndView(viewName);
			mav.addObject("worView", worView); 
			return mav;
		}
		if(submit.equals("1")) {
			List worView = systemmagService.worView();
			List worcom = systemmagService.worcom(code);
			mav = new ModelAndView(viewName);
			mav.addObject("worView", worView);
			mav.addObject("worcom",worcom);
		}
		
		return mav;
	}
	//사업장등록(수정)
		@Override
		@RequestMapping(value = "/member/updbusiness.do", method = RequestMethod.GET)
		public ModelAndView updateWorkplace(@ModelAttribute("") WorkplaceVO workplaceVO, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			System.out.println("값확인" + workplaceVO.getWorrepresentatives_Name());
			systemmagService.updWor(workplaceVO);//서비스파트의 업데이트함수에 매개변수로  VO를전달함
			ModelAndView mav = new ModelAndView(
					"redirect:/member/regbusiness.do?submit=1&&wor_code=" + workplaceVO.getWorkplace_Code());
			return mav;
		}
		//사업장등록(삭제)
		@Override
		@RequestMapping(value = "/member/deletbusiness.do", method = RequestMethod.GET)
		public ModelAndView deleteWorkplace(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String number = (String) request.getParameter("no"); //체크가된 체크박스의 값들을 가져오는 변수임
			String viewName = getViewName(request);
			String[] numberary = number.split(","); //쉼표를 기준으로 나누어 배열에 저장한다

			systemmagService.delWor(numberary);

			ModelAndView mav = new ModelAndView("redirect:/member/regbusiness.do");

			return mav;

		}
		//품목등록(조회)
		@Override
		@RequestMapping(value="/member/regitem.do" ,method = RequestMethod.GET)
		public ModelAndView viewItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = null;
			String viewName = getViewName(request);
			String number = (String) request.getParameter("itemgNumber");
			String submit = (String) request.getParameter("submit");
			String code = (String) request.getParameter("item_code");
			if(code == null && submit == null) {
				List itemView = systemmagService.itemView();
				mav = new ModelAndView(viewName);
				mav.addObject("itemView", itemView);
				return mav;
			}
			if(submit.equals("1")) {
				List itemView = systemmagService.itemView();
				List comitem = systemmagService.comitem(code);
				mav = new ModelAndView(viewName);
				mav.addObject("itemView", itemView);
				mav.addObject("comitem",comitem);
				
			}else if(submit.equals("2")){
				List itemgView = systemmagService.Searchitemg(number);
				
				mav = new ModelAndView(viewName);
				
				mav.addObject("itemView", itemgView);
			}
			return mav;
		}
		//품목등록(팝업)
		@RequestMapping(value="/member/itemgpop.do" ,method = RequestMethod.GET)
		public ModelAndView itgpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = getViewName(request);
			String itgNumber = (String) request.getParameter("itemg_Code");
			List itgView = systemmagService.itgView(itgNumber);
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("itgView", itgView);
			return mav;
		}
		//품목등록
		@Override
		@RequestMapping(value="/member/additem.do" ,method = RequestMethod.GET)
		public ModelAndView addItem(@ModelAttribute("item") itemVO itemVO, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			String path = request.getParameter("path");
			path = path.replace("/webERP", "");
			System.out.println("url" + path);
			int result = 0;
			result = systemmagService.addItem(itemVO);
			ModelAndView mav = new ModelAndView("redirect:"+path);
			return mav;
		}
		//품목등록(수정)
		@Override
		@RequestMapping(value = "/member/upditem.do", method = RequestMethod.GET)
		public ModelAndView updateItem(@ModelAttribute("") itemVO itemVO, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			systemmagService.updItem(itemVO);//서비스파트의 업데이트함수에 매개변수로  VO를전달함
			ModelAndView mav = new ModelAndView(
					"redirect:/member/regitem.do?submit=1&&item_code=" + itemVO.getItem_Code());
			return mav;
		}
		//품목등록(삭제)
		@Override
		@RequestMapping(value = "/member/deleteitem.do", method = RequestMethod.GET)
		public ModelAndView deleteItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String number = (String) request.getParameter("no"); //체크가된 체크박스의 값들을 가져오는 변수임
			String viewName = getViewName(request);
			String[] numberary = number.split(","); //쉼표를 기준으로 나누어 배열에 저장한다

			systemmagService.delItem(numberary);

			ModelAndView mav = new ModelAndView("redirect:/member/regitem.do");

			return mav;

		}
		//품목군등록(조회)
		@Override
		@RequestMapping(value="/member/regitemgroup.do" ,method = RequestMethod.GET)
		public ModelAndView viewItemg(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = null;
			String viewName = getViewName(request);
				List itemgView = systemmagService.itemgView();
				mav = new ModelAndView(viewName);
				mav.addObject("itemgView", itemgView);
				return mav;
		}
		//품목군등록
		@Override
		@RequestMapping(value="/member/additemg.do" ,method = RequestMethod.GET)
		public ModelAndView addItemg(@ModelAttribute("itemg") ItemgVO itemgVO, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			String path = request.getParameter("path");
			path = path.replace("/webERP", "");
			System.out.println("url" + path);
			int result = 0;
			result = systemmagService.addItemg(itemgVO);
			ModelAndView mav = new ModelAndView("redirect:"+path);
			return mav;
		}
		//품목군등록(수정)
		@Override
		@RequestMapping(value = "/member/upditemg.do", method = RequestMethod.GET)
		public ModelAndView updateItemg(@ModelAttribute("") ItemgVO itemgVO, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			systemmagService.updItemg(itemgVO);//서비스파트의 업데이트함수에 매개변수로  VO를전달함
			ModelAndView mav = new ModelAndView(
					"redirect:/member/regitemgroup.do?submit=1&&itemg_code=" + itemgVO.getItem_Group_Code());
			return mav;
		}
		//품목군등록(삭제)
		@Override
		@RequestMapping(value = "/member/deleteItemg.do", method = RequestMethod.GET)
		public ModelAndView deleteItemg(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String number = (String) request.getParameter("no"); //체크가된 체크박스의 값들을 가져오는 변수임
			String viewName = getViewName(request);
			String[] numberary = number.split(","); //쉼표를 기준으로 나누어 배열에 저장한다

			systemmagService.delItemg(numberary);

			ModelAndView mav = new ModelAndView("redirect:/member/regitemgroup.do");

			return mav;

		}
		//사원조회
		@Override
		@RequestMapping(value="/member/inquiryemployees.do" ,method = RequestMethod.GET)
		public ModelAndView viewemployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = null;
			String viewName = getViewName(request);
				List employeeView = systemmagService.employeeView();
				mav = new ModelAndView(viewName);
				mav.addObject("employeeView", employeeView);
				return mav;
		}
		//부서등록(조회)
		@Override
		@RequestMapping(value="/member/regdepartment.do" ,method = RequestMethod.GET)
		public ModelAndView viewdepartment(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = null;
			String viewName = getViewName(request);
				List departmentView = systemmagService.departmentView();
				mav = new ModelAndView(viewName);
				mav.addObject("departmentView", departmentView);
				return mav;
		}
		//부서등록
		@Override
		@RequestMapping(value="/member/adddepartment.do" ,method = RequestMethod.GET)
		public ModelAndView adddepartment(@ModelAttribute("department") DepartmentVO departmentVO, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			String path = request.getParameter("path");
			path = path.replace("/webERP", "");
			System.out.println("url" + path);
			int result = 0;
			result = systemmagService.addDep(departmentVO);
			ModelAndView mav = new ModelAndView("redirect:"+path);
			return mav;
		}
		//부서등록(수정)
		@Override
		@RequestMapping(value = "/member/upddepartment.do", method = RequestMethod.GET)
		public ModelAndView updatedepartment(@ModelAttribute("") DepartmentVO departmentVO, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			systemmagService.updDep(departmentVO);//서비스파트의 업데이트함수에 매개변수로  VO를전달함
			ModelAndView mav = new ModelAndView(
					"redirect:/member/regdepartment.do?submit=1&&dep_code=" + departmentVO.getDepartment_Code());
			return mav;
		}
		//부서등록(삭제)
		@Override
		@RequestMapping(value = "/member/deletedepartment.do", method = RequestMethod.GET)
		public ModelAndView deletedepartment(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String number = (String) request.getParameter("no"); //체크가된 체크박스의 값들을 가져오는 변수임
			String viewName = getViewName(request);
			String[] numberary = number.split(","); //쉼표를 기준으로 나누어 배열에 저장한다

			systemmagService.delDep(numberary);

			ModelAndView mav = new ModelAndView("redirect:/member/regdepartment.do");

			return mav;

		}
		//부서등록(팝업)
				@RequestMapping(value="/member/departmentpop.do" ,method = RequestMethod.GET)
				public ModelAndView departmentpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
					String viewName = getViewName(request);
					String depNumber = (String) request.getParameter("dep_Code");
					List depView = systemmagService.depView(depNumber);
					ModelAndView mav = new ModelAndView(viewName);
					mav.addObject("depView", depView);
					return mav;
				}
		//부문(팝업)
				@RequestMapping(value="/member/sectorpop.do" ,method = RequestMethod.GET)
				public ModelAndView Sectorpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
					String viewName = getViewName(request);
					String secNumber = (String) request.getParameter("sec_Code");
					List secView = systemmagService.secView(secNumber);
					ModelAndView mav = new ModelAndView(viewName);
					mav.addObject("secView", secView);
					return mav;
				}
	//겟뷰네임
				
				//장순웅 검색 팝업
				@ResponseBody
				@RequestMapping(value = "/member/searchPopItemgName.do", method = RequestMethod.GET)
				public ModelAndView searchPopName(@RequestParam("itemName") String itemName) throws Exception {
					ModelAndView mav = new ModelAndView();
					List<ItemgVO> popName = null;
					popName = systemmagService.searchPopName(itemName);
					mav.addObject("popName", popName);
					mav.setViewName("jsonView");

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
	public ModelAndView adressZip(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	//------------------------------ajax Controller
	@ResponseBody//ajax관련 컨트롤러(거래처코드)
	@RequestMapping(value = "/member/searchPopCompanyZipCode.do", method = RequestMethod.GET)
	public ModelAndView searchPopCompanyZipCode(@RequestParam("itemName") String itemName) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SystemmagVOMJ> popName = null;
//		popName = systemmagService.searchPopCustomerName(itemName);
		popName = systemmagServiceMJ.searchPopZipCodeName(itemName);
		mav.addObject("popName", popName);
		mav.setViewName("jsonView");

		return mav;
	}
	
	
}

