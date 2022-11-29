package com.myspring.invenBasicInfo.regItemUnitPrice.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("iupVO")
public class iupVO {
	private int no;
	private String itemNumber;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int purchasePrice;
	private int salesPrice;
	private List<iupVO> ListVO;
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
	}
	
	public iupVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getInventoryUnit() {
		return inventoryUnit;
	}

	public void setInventoryUnit(String inventoryUnit) {
		this.inventoryUnit = inventoryUnit;
	}

	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public int getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}

	public List<iupVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<iupVO> listVO) {
		ListVO = listVO;
	}

}
