package com.myspring.salesmanage.salesplan.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("spVO")
public class spVO {
	private Date planDate; //판매계획등록일자
	private String itemCode; //품번
	private String itemName; //품명
	private String standard; //규격
	private String inventoryUnit; //단위
	private int planItemQuantity; //수량
	private int planUnitPrice; //예상단가
	private int newPlanItemQuantity; //수정후 수량
	private int newPlanUnitPrice; //수정후 예상단가
	private List<spVO> ListVO;
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
	}
	
	public spVO() {
		super();
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
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

	public int getPlanItemQuantity() {
		return planItemQuantity;
	}

	public void setPlanItemQuantity(int planItemQuantity) {
		this.planItemQuantity = planItemQuantity;
	}

	public int getPlanUnitPrice() {
		return planUnitPrice;
	}

	public void setPlanUnitPrice(int planUnitPrice) {
		this.planUnitPrice = planUnitPrice;
	}

	public int getNewPlanItemQuantity() {
		return newPlanItemQuantity;
	}

	public void setNewPlanItemQuantity(int newPlanItemQuantity) {
		this.newPlanItemQuantity = newPlanItemQuantity;
	}

	public int getNewPlanUnitPrice() {
		return newPlanUnitPrice;
	}

	public void setNewPlanUnitPrice(int newPlanUnitPrice) {
		this.newPlanUnitPrice = newPlanUnitPrice;
	}

	public List<spVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<spVO> listVO) {
		ListVO = listVO;
	}
	
	
}
