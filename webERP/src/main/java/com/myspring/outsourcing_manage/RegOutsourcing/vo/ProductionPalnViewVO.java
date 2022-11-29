package com.myspring.outsourcing_manage.RegOutsourcing.vo;

import java.sql.Date;

public class ProductionPalnViewVO {
	String productionPlanCode;
	String itemCode;
	String itemName;
	String standard;
	String inventoryUnit;
	int dailyProduction;
	int sequence;
	Date schedule;
	int quantity;
	String note;
	public ProductionPalnViewVO() {
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

	public int getDailyProduction() {
		return dailyProduction;
	}

	public void setDailyProduction(int dailyProduction) {
		this.dailyProduction = dailyProduction;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public Date getSchedule() {
		return schedule;
	}

	public void setSchedule(Date schedule) {
		this.schedule = schedule;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getProductionPlanCode() {
		return productionPlanCode;
	}

	public void setProductionPlanCode(String productionPlanCode) {
		productionPlanCode = productionPlanCode;
	}


	
	
}
