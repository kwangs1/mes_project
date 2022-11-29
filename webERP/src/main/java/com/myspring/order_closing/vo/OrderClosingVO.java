package com.myspring.order_closing.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.systemmag.vo.SystemmagVOMJ;

@Component("orderclosingVO")
public class OrderClosingVO {
	private String order_no;
	private Date order_date;
	private int code;
	private String general_Customer_Name;
	private int sequence;
	private String item_Code;
	private String item_Name;
	private String standard;
	private String inventory_unit;
	private int order_quantity;
	private int cost; 
	private String deadline;
	private String note;
	private List<OrderClosingVO> ListVO;

	

	public String getGeneral_Customer_Name() {
		return general_Customer_Name;
	}

	public void setGeneral_Customer_Name(String general_Customer_Name) {
		this.general_Customer_Name = general_Customer_Name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {return Arrays.toString(ListVO.toArray());}
	
	public OrderClosingVO() {super();}
	
	public List<OrderClosingVO> getListVO() {return ListVO;}
	public void setListVO(List<OrderClosingVO> listVO) {ListVO = new ArrayList();}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getItem_Code() {
		return item_Code;
	}

	public void setItem_Code(String item_Code) {
		this.item_Code = item_Code;
	}

	public String getItem_Name() {
		return item_Name;
	}

	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getInventory_unit() {
		return inventory_unit;
	}

	public void setInventory_unit(String inventory_unit) {
		this.inventory_unit = inventory_unit;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

}
