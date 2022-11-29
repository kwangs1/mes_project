package com.myspring.commonProduction.operationInsClosing.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class OperationInsClosingDetailVO {
	private int no;
	private String workOrderNumber;
	private Date instructionDate;
	private Date dueDate;
	private String processCode;
	private String workplaceCode;
	private int indicatedQuantity;
	private int sumPerformanceQuantity;
	private int remainingPerformance;
	private int unitPrice;
	private int parentPrice;
	private String productionFacility;
	private String inspection;
	private String note;
	private List<OperationInsClosingDetailVO> DetailVO;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getInstructionDate() {
		return instructionDate;
	}
	public void setInstructionDate(Date instructionDate) {
		this.instructionDate = instructionDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getProcessCode() {
		return processCode;
	}
	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}
	public String getWorkplaceCode() {
		return workplaceCode;
	}
	public void setWorkplaceCode(String workplaceCode) {
		this.workplaceCode = workplaceCode;
	}

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
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getParentPrice() {
		return parentPrice;
	}
	public void setParentPrice(int parentPrice) {
		this.parentPrice = parentPrice;
	}
	public String getProductionFacility() {
		return productionFacility;
	}
	public void setProductionFacility(String productionFacility) {
		this.productionFacility = productionFacility;
	}
	public String getInspection() {
		return inspection;
	}
	public void setInspection(String inspection) {
		this.inspection = inspection;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public List<OperationInsClosingDetailVO> getDetailVO() {
		return DetailVO;
	}
	public void setDetailVO(List<OperationInsClosingDetailVO> detailVO) {
		this.DetailVO = new ArrayList<OperationInsClosingDetailVO>();
	}
	public String getWorkOrderNumber() {
		return workOrderNumber;
	}
	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}
	
}
