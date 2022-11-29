package com.myspring.commonProduction.registOperationPerformance.vo;

public class PerformanceQuantityVO {
	private int performanceQuantity;
	private String itemCode;
	private String division;
	
	public int getPerformanceQuantity() {
		return performanceQuantity;
	}
	
	public void setPerformanceQuantity(int performanceQuantity) {
		this.performanceQuantity = performanceQuantity;
	}
	
	public String getItemCode() {
		return itemCode;
	}
	
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	
	public PerformanceQuantityVO() {	
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}
	
	
	
}
