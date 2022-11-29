package com.myspring.salesmanage.order.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.salesmanage.cor.vo.CorVO;

@Component("orderVO")
public class OrderVO {
	
	private String ordCode;
	private Date ordDate;
	private String custCode;
	private String tax;
	private String note;
	
	//cust
	private String custName;
	private String comNum;
	private String repName;
	private List<OrderVO> ListOrd;
	private CorVO corVO;

	
	@Override
	public String toString() {
		return Arrays.toString(ListOrd.toArray());
	}
	

	public OrderVO() {
		super();
	}


	public String getOrdCode() {
		return ordCode;
	}


	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}


	public Date getOrdDate() {
		return ordDate;
	}


	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}


	public String getCustCode() {
		return custCode;
	}


	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}


	public String getTax() {
		return tax;
	}


	public void setTax(String tax) {
		this.tax = tax;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}

	public String getCustName() {
		return custName;
	}


	public void setCustName(String custName) {
		this.custName = custName;
	}


	public String getComNum() {
		return comNum;
	}


	public void setComNum(String comNum) {
		this.comNum = comNum;
	}


	public String getRepName() {
		return repName;
	}


	public void setRepName(String repName) {
		this.repName = repName;
	}


	public List<OrderVO> getListOrd() {
		return ListOrd;
	}


	public void setListOrd(List<OrderVO> listOrd) {
		ListOrd = listOrd;
	}


	public CorVO getCorVO() {
		return corVO;
	}


	public void setCorVO(CorVO corVO) {
		this.corVO = corVO;
	}


}
