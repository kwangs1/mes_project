package com.myspring.Billing.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.MainPlan.vo.MainPlanVO;

@Component("billingVO")
public class BIllIngVO {
private int sequence;
private String claim_no;
private Date claim_date;
private String claim_division;
private String item_Code;
private String item_Name;
private String standard;
private Date requestdate;
private int inventory_qty;
private int claim_quantity;
private String buyer;
private String note;

private List<BIllIngVO> ListVO;



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

public Date getRequestdate() {
	return requestdate;
}

public void setRequestdate(Date requestdate) {
	this.requestdate = requestdate;
}

public int getInventory_qty() {
	return inventory_qty;
}

public void setInventory_qty(int inventory_qty) {
	this.inventory_qty = inventory_qty;
}

public int getClaim_quantity() {
	return claim_quantity;
}

public void setClaim_quantity(int claim_quantity) {
	this.claim_quantity = claim_quantity;
}

public String getBuyer() {
	return buyer;
}

public void setBuyer(String buyer) {
	this.buyer = buyer;
}

@Override
public String toString() {return Arrays.toString(ListVO.toArray());}

public BIllIngVO() {super();}

public List<BIllIngVO> getListVO() {return ListVO;}
public void setListVO(List<BIllIngVO> listVO) {ListVO = new ArrayList();}

public String getClaim_no() {return claim_no;}
public void setClaim_no(String claim_no) {this.claim_no=claim_no;}

public Date getClaim_date() {return claim_date;}
public void setClaim_date(Date claim_date) {this.claim_date=claim_date;}

public String getClaim_division() {return claim_division;}
public void setClaim_division(String claim_division) {this.claim_division=claim_division;}

public String getNote() {return note;}
public void setNote(String note) {this.note=note;}

public int getSequence() {return sequence;}
public void setSequence(int sequence) {this.sequence=sequence;}

}
