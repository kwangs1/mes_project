package com.myspring.commonProduction.operationRegist.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class OperationDetailVO {
	private String forwardingNumber;
	private String workOrderNumber;
	private Date billingDate;
	private String itemCode;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int precisionQuantity;
	private int loss;	
	private int comfirmQuantity;
	private int forwardingQuantity;
	private String note;
	private List<OperationDetailVO> DetailVO;
	
	public OperationDetailVO() {
	}

	@Override
	public String toString() {
		return Arrays.toString(DetailVO.toArray());
	}


	public int getForwardingQuantity() {
		return forwardingQuantity;
	}

	public void setForwardingQuantity(int forwardingQuantity) {
		this.forwardingQuantity = forwardingQuantity;
	}

	public String getForwardingNumber() {
		return forwardingNumber;
	}

	public void setForwardingNumber(String forwardingNumber) {
		this.forwardingNumber = forwardingNumber;
	}

	public Date getBillingDate() {
		return billingDate;
	}

	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
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

	public int getPrecisionQuantity() {
		return precisionQuantity;
	}

	public void setPrecisionQuantity(int precisionQuantity) {
		this.precisionQuantity = precisionQuantity;
	}

	public int getLoss() {
		return loss;
	}

	public void setLoss(int loss) {
		this.loss = loss;
	}

	public int getComfirmQuantity() {
		return comfirmQuantity;
	}

	public void setComfirmQuantity(int comfirmQuantity) {
		this.comfirmQuantity = this.precisionQuantity + (this.precisionQuantity / 100 * this.loss);
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public List<OperationDetailVO> getDetailVO() {
		return DetailVO;
	}

	public void setDetailVO(List<OperationDetailVO> detailVO) {
		DetailVO = new ArrayList();
	}


	public String getWorkOrderNumber() {
		return workOrderNumber;
	}

	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}
	
	
}
