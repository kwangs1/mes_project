package com.myspring.commonProduction.commitOperationInstruction.vo;
 
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;




@Component("CommitOperationInstructionVO")
public class CommitOperationInstructionVO {
	private int NO; 
	private String productionPlanCode;
	private String itemCode;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int dailyProduction;
	private int sequence;
	private Date scheduled;
	private int quantity;
	private Date startDate;
	private Date endDate;
	private String note;
	private List<CommitOperationInstructionVO> ListVO;
	

	public int getNO() {
		return NO;
	}

	public List<CommitOperationInstructionVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<CommitOperationInstructionVO> listVO) {
		ListVO = new ArrayList();
	}

	public void setNO(int nO) {
		NO = nO;
	}
	
	public CommitOperationInstructionVO() {
		super();
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

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public Date getScheduled() {
		return scheduled;
	}

	public void setScheduled(Date scheduled) {
		this.scheduled = scheduled;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getDailyProduction() {
		return dailyProduction;
	}

	public void setDailyProduction(int dailyProduction) {
		this.dailyProduction = dailyProduction;
	}

	public String getProductionPlanCode() {
		return productionPlanCode;
	}

	public void setProductionPlanCode(String productionPlanCode) {
		this.productionPlanCode = productionPlanCode;
	}
 
	
	
 }
