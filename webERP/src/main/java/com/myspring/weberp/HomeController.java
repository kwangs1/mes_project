package com.myspring.weberp;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
/*@Controller
public class HomeController {
  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  /**
  * Simply selects the home view to render by returning its name.
  */
  /*  @RequestMapping(value = "/main", method = RequestMethod.GET)
  public String home(Locale locale, Model model) {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, 
    DateFormat.LONG, locale);
    String formattedDate = dateFormat.format(date);
    model.addAttribute("serverTime", formattedDate );
    return "main";
  }
}*/


@Controller

public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/member/regcompany", method = RequestMethod.GET)
	public String regcompany(Locale locale, Model model) {
		return "/member/regcompany";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "/member/login";
	}
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {
		return "/member/logout";
	}
	@RequestMapping(value = "/member/loginfailed", method = RequestMethod.GET)
	public String loginfailed(Locale locale, Model model) {
		return "/member/loginfailed";
	}
	@RequestMapping(value = "/member/regbusiness", method = RequestMethod.GET)
	public String regbusiness(Locale locale, Model model) {
		return "/member/regbusiness";
	}
	@RequestMapping(value = "/member/regdepartment", method = RequestMethod.GET)
	public String regdepartment(Locale locale, Model model) {
		return "/member/regdepartment";
	}
	@RequestMapping(value = "/member/inquiryemployees", method = RequestMethod.GET)
	public String inquiryemployees(Locale locale, Model model) {
		return "/member/inquiryemployees";
	}
	@RequestMapping(value = "/member/regbasicacc", method = RequestMethod.GET)
	public String regbasicacc(Locale locale, Model model) {
		return "/member/regbasicacc";
	}
	@RequestMapping(value = "/member/regitemgroup", method = RequestMethod.GET)
	public String regitmgroup(Locale locale, Model model) {
		return "/member/regitemgroup";
	}
	@RequestMapping(value = "/member/regitem", method = RequestMethod.GET)
	public String regitm(Locale locale, Model model) {
		return "/member/regitem";
	}
	@RequestMapping(value = "/member/outware", method = RequestMethod.GET)
	public String outware(Locale locale, Model model) {
		return "/member/outware";
	}
	@RequestMapping(value = "/member/logistics_manage", method = RequestMethod.GET)
	public String logman(Locale locale, Model model) {
		return "/member/logistics_manage";
	}
	@RequestMapping(value = "/member/logperbusi", method = RequestMethod.GET)
	public String logbusi(Locale locale, Model model) {
		return "/member/logperbusi";
	}
	@RequestMapping(value = "/member/logperitem", method = RequestMethod.GET)
	public String logitem(Locale locale, Model model) {
		return "/member/logperitem";
	}
	@RequestMapping(value = "/member/reginspection", method = RequestMethod.GET)
	public String instype(Locale locale, Model model) {
		return "/member/reginspection";
	}
	@RequestMapping(value = "/member/regsetcom", method = RequestMethod.GET)
	public String regsetcom(Locale locale, Model model) {
		return "/member/regsetcom";
	}
	@RequestMapping(value = "/member/regsalesplan", method = RequestMethod.GET)
	public String regsalesplan(Locale locale, Model model) {
		return "/member/regsalesplan";
	}
	@RequestMapping(value = "/member/regestimate", method = RequestMethod.GET)
	public String regestimate(Locale locale, Model model) {
		return "/member/regestimate";
	}
	@RequestMapping(value = "/member/regorder", method = RequestMethod.GET)
	public String regorder(Locale locale, Model model) {
		return "/member/regorder";
	}
	@RequestMapping(value = "/member/regforreq", method = RequestMethod.GET)
	public String regforreq(Locale locale, Model model) {
		return "/member/regforreq";
	}
	@RequestMapping(value = "/member/forwarding", method = RequestMethod.GET)
	public String forwarding(Locale locale, Model model) {
		return "/member/forwarding";
	}
	@RequestMapping(value = "/member/transactionissue", method = RequestMethod.GET)
	public String tranissue(Locale locale, Model model) {
		return "/member/transactionissue";
	}
	@RequestMapping(value = "/member/quotationstatus", method = RequestMethod.GET)
	public String quotation(Locale locale, Model model) {
		return "/member/quotationstatus";
	}
	@RequestMapping(value = "/member/salesplanstat", method = RequestMethod.GET)
	public String salesplanstat(Locale locale, Model model) {
		return "/member/salesplanstat";
	}
	@RequestMapping(value = "/member/salesplancont", method = RequestMethod.GET)
	public String salesplancont(Locale locale, Model model) {
		return "/member/salesplancont";
	}
	@RequestMapping(value = "/member/quotationcont", method = RequestMethod.GET)
	public String quocont(Locale locale, Model model) {
		return "/member/quotationcont";
	}
	@RequestMapping(value = "/member/orderstat", method = RequestMethod.GET)
	public String orderstat(Locale locale, Model model) {
		return "/member/orderstat";
	}
	@RequestMapping(value = "/member/ordercontrast", method = RequestMethod.GET)
	public String ordercont(Locale locale, Model model) {
		return "/member/ordercontrast";
	}
	@RequestMapping(value = "/member/releasestat", method = RequestMethod.GET)
	public String relstat(Locale locale, Model model) {
		return "/member/releasestat";
	}
	@RequestMapping(value = "/member/relreturnstat", method = RequestMethod.GET)
	public String relreturn(Locale locale, Model model) {
		return "/member/relreturnstat";
	}
	@RequestMapping(value = "/member/mainplan", method = RequestMethod.GET)
	public String mainplan(Locale locale, Model model) {
		return "/member/mainplan";
	}
	@RequestMapping(value = "/member/requiredamount", method = RequestMethod.GET)
	public String reqamount(Locale locale, Model model) {
		return "/member/requiredamount";
	}
	@RequestMapping(value = "/member/regbilling", method = RequestMethod.GET)
	public String regbilling(Locale locale, Model model) {
		return "/member/regbilling";
	}
	@RequestMapping(value = "/member/processinwork", method = RequestMethod.GET)
	public String workInProcess(Locale locale, Model model) {
		return "/member/processinwork";
	}
	@RequestMapping(value = "/member/regordering", method = RequestMethod.GET)
	public String regordering(Locale locale, Model model) {
		return "/member/regordering";
	}
	@RequestMapping(value = "/member/regreceivereq", method = RequestMethod.GET)
	public String regreceivereq(Locale locale, Model model) {
		return "/member/regreceivereq";
	}
	@RequestMapping(value = "/member/regreceiveins", method = RequestMethod.GET)
	public String regreceiveins(Locale locale, Model model) {
		return "/member/regreceiveins";
	}
	@RequestMapping(value = "/member/receiveprocess", method = RequestMethod.GET)
	public String recpro(Locale locale, Model model) {
		return "/member/receiveprocess";
	}
	@RequestMapping(value = "/member/orderclosing", method = RequestMethod.GET)
	public String orderclosing(Locale locale, Model model) {
		return "/member/orderclosing";
	}
	@RequestMapping(value = "/member/purchaseclosing", method = RequestMethod.GET)
	public String purchaseclosing(Locale locale, Model model) {
		return "/member/purchaseclosing";
	}
	@RequestMapping(value = "/member/moveware", method = RequestMethod.GET)
	public String moveware(Locale locale, Model model) {
		return "/member/moveware";
	}
	@RequestMapping(value = "/member/movebusiness", method = RequestMethod.GET)
	public String movebusi(Locale locale, Model model) {
		return "/member/movebusiness";
	}
	@RequestMapping(value = "/member/baseinventory", method = RequestMethod.GET)
	public String baseinven(Locale locale, Model model) {
		return "/member/baseinventory";
	}
	@RequestMapping(value = "/member/supplyadj", method = RequestMethod.GET)
	public String supplyadj(Locale locale, Model model) {
		return "/member/supplyadj";
	}
	@RequestMapping(value = "/member/supplyadjstat", method = RequestMethod.GET)
	public String supplyadjstat(Locale locale, Model model) {
		return "/member/supplyadjstat";
	}
	@RequestMapping(value = "/member/baseinventorystat", method = RequestMethod.GET)
	public String baseinvenstat(Locale locale, Model model) {
		return "/member/baseinventorystat";
	}
	@RequestMapping(value = "/member/curinvenstat", method = RequestMethod.GET)
	public String curinvenstat(Locale locale, Model model) {
		return "/member/curinvenstat";
	}
	@RequestMapping(value = "/member/supplystat", method = RequestMethod.GET)
	public String supplystat(Locale locale, Model model) {
		return "/member/supplystat";
	}
	@RequestMapping(value = "/member/lotbusiness", method = RequestMethod.GET)
	public String lotbusiness(Locale locale, Model model) {
		return "/member/lotbusiness";
	}
	@RequestMapping(value = "/member/lotware", method = RequestMethod.GET)
	public String lotware(Locale locale, Model model) {
		return "/member/lotware";
	}
	@RequestMapping(value = "/member/itemunitprice", method = RequestMethod.GET)
	public String itemprice(Locale locale, Model model) {
		return "/member/itemunitprice";
	}
	@RequestMapping(value = "/member/proplanreg", method = RequestMethod.GET)
	public String proplanreg(Locale locale, Model model) {
		return "/member/proplanreg";
	}
	@RequestMapping(value = "/member/regoperins", method = RequestMethod.GET)
	public String regoperins(Locale locale, Model model) {
		return "/member/regoperins";
	}
	@RequestMapping(value = "/member/comoperins", method = RequestMethod.GET)
	public String comoperins(Locale locale, Model model) {
		return "/member/comoperins";
	}
	@RequestMapping(value = "/member/prometfor", method = RequestMethod.GET)
	public String prometfor(Locale locale, Model model) {
		return "/member/prometfor";
	}
	@RequestMapping(value = "/member/regoperperf", method = RequestMethod.GET)
	public String regoperperf(Locale locale, Model model) {
		return "/member/regoperperf";
	}
	@RequestMapping(value = "/member/operinsclo", method = RequestMethod.GET)
	public String operinsclo(Locale locale, Model model) {
		return "/member/operinsclo";
	}
	@RequestMapping(value = "/member/regoutsourcing", method = RequestMethod.GET)
	public String regoutsourcing(Locale locale, Model model) {
		return "/member/regoutsourcing";
	}
	@RequestMapping(value = "/member/comoutsourcing", method = RequestMethod.GET)
	public String comoutsourcing(Locale locale, Model model) {
		return "/member/comoutsourcing";
	}
	@RequestMapping(value = "/member/outrelease", method = RequestMethod.GET)
	public String outrelease(Locale locale, Model model) {
		return "/member/outrelease";
	}
	@RequestMapping(value = "/member/regoutper", method = RequestMethod.GET)
	public String regoutper(Locale locale, Model model) {
		return "/member/regoutper";
	}
	@RequestMapping(value = "/member/outclosing", method = RequestMethod.GET)
	public String outclosing(Locale locale, Model model) {
		return "/member/outclosing";
	}
	@RequestMapping(value = "/member/regbom", method = RequestMethod.GET)
	public String regbom(Locale locale, Model model) {
		return "/member/regbom";
	}
	@RequestMapping(value = "/member/rightbom", method = RequestMethod.GET)
	public String rightbom(Locale locale, Model model) {
		return "/member/rightbom";
	}
	@RequestMapping(value = "/member/reservebom", method = RequestMethod.GET)
	public String reservebom(Locale locale, Model model) {
		return "/member/reservebom";
	}
	@RequestMapping(value = "/member/outprice", method = RequestMethod.GET)
	public String outprice(Locale locale, Model model) {
		return "/member/outprice";
	}
	@RequestMapping(value = "/member/deftype", method = RequestMethod.GET)
	public String deftype(Locale locale, Model model) {
		return "/member/deftype";
	}
	@RequestMapping(value = "/member/systemmain", method = RequestMethod.GET)
	public String systemmain(Locale locale, Model model) {
		return "/member/systemmain";
	}
	@RequestMapping(value = "/member/businessmain", method = RequestMethod.GET)
	public String businessmain(Locale locale, Model model) {
		return "/member/businessmain";
	}
	@RequestMapping(value = "/member/purchasemain", method = RequestMethod.GET)
	public String purchasemain(Locale locale, Model model) {
		return "/member/purchasemain";
	}
	@RequestMapping(value = "/member/productionmain", method = RequestMethod.GET)
	public String productionmain(Locale locale, Model model) {
		return "/member/productionmain";
	}
	@RequestMapping(value = "/member/codehelper", method = RequestMethod.GET)
	public String Popup(Locale locale, Model model) {
		return "/member/codehelper";
	}
	@RequestMapping(value = "/member/curfinishedinvenstat", method = RequestMethod.GET)
	public String dhkswpvna(Locale locale, Model model) {
		return "/member/curfinishedinvenstat";
	}

}

