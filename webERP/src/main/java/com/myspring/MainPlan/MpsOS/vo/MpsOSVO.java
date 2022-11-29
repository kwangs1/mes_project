package com.myspring.MainPlan.MpsOS.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.myspring.salesmanage.cor.vo.CorVO;
import com.myspring.salesmanage.order.vo.OrderVO;

@Component("mpsosVO")
public class MpsOSVO {
	private String orderno;
	private int sequence;
	private Date ordersdate;
	private String general_Customer_Name;
	private String item_Code;
	private String item_Name;
	private String standard;
	private String inventory_unit;
	private int ordersQuantity;
	private Date expectedDate;
	private String note;


public MpsOSVO() {}


public String getOrderno() {return orderno;}
public void setOrderno(String orderno) {this.orderno=orderno;}

public int getSequence() {return sequence;}
public void setSequence(int sequence) {this.sequence=sequence;}

public Date getOrdersdate() {return ordersdate;}
public void setOrdersdate(Date ordersdate) {this.ordersdate=ordersdate;}


public String getGeneral_Customer_Name() {
	return general_Customer_Name;
}


public void setGeneral_Customer_Name(String general_Customer_Name) {
	this.general_Customer_Name = general_Customer_Name;
}


public String getItem_Code() {return item_Code;}
public void setItem_Code(String item_Code) {this.item_Code=item_Code;}

public String getItem_Name() {return item_Name;}
public void setItem_Name(String item_Name) {this.item_Name=item_Name;}

public String getStandard() {return standard;}
public void setStandard(String standard) {this.standard=standard;}

public String getInventory_unit() {return inventory_unit;}
public void setInventory_unit(String inventory_unit) {this.inventory_unit=inventory_unit;}



public int getOrdersQuantity() {
	return ordersQuantity;
}


public void setOrdersQuantity(int ordersQuantity) {
	this.ordersQuantity = ordersQuantity;
}


public Date getExpectedDate() {
	return expectedDate;
}


public void setExpectedDate(Date expectedDate) {
	this.expectedDate = expectedDate;
}


public String getNote() {return note;}
public void setNote(String note) {this.note=note;}

}
