package com.myspring.businessStatus.releaseStatus.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("rsVO")
public class rsVO {
	private String itemCode; //품번
	private String itemName; //품명
	private Date dueDate; //납기일
	private int ordersQuantity; //주문수량
	private int productPrice; //단가
	private int vatPrice; //부가세계산용단가
	private String orderOX; //출고구분
	private Date startDate;
	private Date endDate;
	rsjVO rsjVO;
	private List<rsVO> ListVO;
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
	}
	
	public rsVO() {
		super();
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getOrdersQuantity() {
		return ordersQuantity;
	}

	public void setOrdersQuantity(int ordersQuantity) {
		this.ordersQuantity = ordersQuantity;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getVatPrice() {
		return vatPrice;
	}

	public void setVatPrice(int vatPrice) {
		this.vatPrice = vatPrice;
	}

	public String getOrderOX() {
		return orderOX;
	}

	public void setOrderOX(String orderOX) {
		this.orderOX = orderOX;
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

	public rsjVO getRsjVO() {
		return rsjVO;
	}

	public void setRsjVO(rsjVO rsjVO) {
		this.rsjVO = rsjVO;
	}

	public List<rsVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<rsVO> listVO) {
		ListVO = listVO;
	}

}
