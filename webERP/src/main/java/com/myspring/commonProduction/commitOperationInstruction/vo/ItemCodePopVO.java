package com.myspring.commonProduction.commitOperationInstruction.vo;

public class ItemCodePopVO {
	private String itemCode;
	private String itemName;
	private String inventoryUnit;
	private int dailyProduction;
	
	public ItemCodePopVO() {
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
	
	
}
