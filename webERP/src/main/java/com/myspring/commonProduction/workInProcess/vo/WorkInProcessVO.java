package com.myspring.commonProduction.workInProcess.vo;

public class WorkInProcessVO {
	private String itemCode;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int indicatedQuantity;
	private int sumPerformanceQuantity;
	private int remainingPerformance;
	
	
	
	public int getIndicatedQuantity() {
		return indicatedQuantity;
	}

	public void setIndicatedQuantity(int indicatedQuantity) {
		this.indicatedQuantity = indicatedQuantity;
	}

	public int getSumPerformanceQuantity() {
		return sumPerformanceQuantity;
	}

	public void setSumPerformanceQuantity(int sumPerformanceQuantity) {
		this.sumPerformanceQuantity = sumPerformanceQuantity;
	}

	public int getRemainingPerformance() {
		return remainingPerformance;
	}

	public void setRemainingPerformance(int remainingPerformance) {
		this.remainingPerformance = remainingPerformance;
	}

	public WorkInProcessVO() {	
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
	
}
