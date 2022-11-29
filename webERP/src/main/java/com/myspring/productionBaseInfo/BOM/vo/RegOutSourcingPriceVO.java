package com.myspring.productionBaseInfo.BOM.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("outpriVO")
public class RegOutSourcingPriceVO {
	private String outsourcing_Code;
	private String outcustomer;
	private String item_code;
	private String outprice;
	private Date startDate;
	private Date endDate;
	bomVO bomVO;
	List<RegOutSourcingPriceVO> outpriveVO;
	public String getOutsourcing_Code() {
		return outsourcing_Code;
	}
	public void setOutsourcing_Code(String outsourcing_Code) {
		this.outsourcing_Code = outsourcing_Code;
	}
	public String getOutcustomer() {
		return outcustomer;
	}
	public void setOutcustomer(String outcustomer) {
		this.outcustomer = outcustomer;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getOutprice() {
		return outprice;
	}
	public void setOutprice(String outprice) {
		this.outprice = outprice;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public List<RegOutSourcingPriceVO> getOutpriveVO() {
		return outpriveVO;
	}
	public void setOutpriveVO(List<RegOutSourcingPriceVO> outpriveVO) {
		this.outpriveVO = outpriveVO;
	}
	public bomVO getBomVO() {
		return bomVO;
	}
	public void setBomVO(bomVO bomVO) {
		this.bomVO = bomVO;
	}
	
}
