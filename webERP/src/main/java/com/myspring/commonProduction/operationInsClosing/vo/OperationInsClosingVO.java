package com.myspring.commonProduction.operationInsClosing.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;


@Component("OperationInsClosingVO") 

public class OperationInsClosingVO {
	private String OPNumber;
	private Date instructionDate;
	private Date dueDate;
	private String processCode;
	private String workplaceCode;
	private int indicatedQuantity;
	private int sumPerformanceQuantity;
	private int remainingPerformance;
	private int unitPrice;
	private int price;
	private String inspection;
	private String note;
	private String workOrderNumber;
	private List<OperationInsClosingVO> ListVO;
	
	public OperationInsClosingVO() {
		
	}
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
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

	public String getWorkplaceCode() {
		return workplaceCode;
	}
	public void setWorkplaceCode(String workplaceCode) {
		this.workplaceCode = workplaceCode;
	}

	public List<OperationInsClosingVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<OperationInsClosingVO> ListVO) {
		ListVO = new ArrayList();
	}

	public String getOPNumber() {
		return OPNumber;
	}

	public void setOPNumber(String oPNumber) {
		OPNumber = oPNumber;
	}

	public String getProcessCode() {
		return processCode;
	}

	public void setProcessCode(String processCode) {
		this.processCode = processCode;
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

	public String getWorkOrderNumber() {
		return workOrderNumber;
	}

	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
