package com.myspring.outsourcing_manage.ComOutsourcing.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;


@Component("ComOutsourcingVO")
public class ComOutsourcingVO {
	private String workOrderNumber;
	private String materialForwardingStatus;
	private String workplaceCode;
	private Date instructionDate;
	private Date dueDate;
	private String parentItemCode;
	private String parentItemName;
	private String parentStandard;
	private String parentInventoryUnit;
	private int indicatedQuantity;
	private int unitPrice;
	private int parentPrice;
	private String status;
	private String inspection;
	private String ParentNote;
	private String productionPlanCode;	
	
	private int no;
	private Date billingDate;
	private String itemCode;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int precisionQuantity;
	private int loss;	
	private int comfirmQuantity;
	private int outsourcingUnitPrice;
	private int price;
	private String note;
	
	private List<ComOutsourcingVO> ListVO;
	
	public ComOutsourcingVO() {
		super();
	}

	public String getWorkOrderNumber() {
		return workOrderNumber;
	}

	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}

	public String getMaterialForwardingStatus() {
		return materialForwardingStatus;
	}

	public void setMaterialForwardingStatus(String materialForwardingStatus) {
		this.materialForwardingStatus = materialForwardingStatus;
	}

	public String getWorkplaceCode() {
		return workplaceCode;
	}

	public void setWorkplaceCode(String workplaceCode) {
		this.workplaceCode = workplaceCode;
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

	public String getParentItemCode() {
		return parentItemCode;
	}

	public void setParentItemCode(String parentItemCode) {
		this.parentItemCode = parentItemCode;
	}

	public String getParentItemName() {
		return parentItemName;
	}

	public void setParentItemName(String parentItemName) {
		this.parentItemName = parentItemName;
	}

	public String getParentStandard() {
		return parentStandard;
	}

	public void setParentStandard(String parentStandard) {
		this.parentStandard = parentStandard;
	}

	public String getParentInventoryUnit() {
		return parentInventoryUnit;
	}

	public void setParentInventoryUnit(String parentInventoryUnit) {
		this.parentInventoryUnit = parentInventoryUnit;
	}

	public int getIndicatedQuantity() {
		return indicatedQuantity;
	}

	public void setIndicatedQuantity(int indicatedQuantity) {
		this.indicatedQuantity = indicatedQuantity;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInspection() {
		return inspection;
	}

	public void setInspection(String inspection) {
		this.inspection = inspection;
	}

	public String getParentNote() {
		return ParentNote;
	}

	public void setParentNote(String parentNote) {
		ParentNote = parentNote;
	}

	public String getProductionPlanCode() {
		return productionPlanCode;
	}

	public void setProductionPlanCode(String productionPlanCode) {
		this.productionPlanCode = productionPlanCode;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public int getLoss() {
		return loss;
	}

	public void setLoss(int loss) {
		this.loss = loss;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}


	public List<ComOutsourcingVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<ComOutsourcingVO> listVO) {
		ListVO = listVO;
	}

	public Date getBillingDate() {
		return billingDate;
	}

	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
	}

	public int getPrecisionQuantity() {
		return precisionQuantity;
	}

	public void setPrecisionQuantity(int precisionQuantity) {
		this.precisionQuantity = precisionQuantity;
	}

	public int getParentPrice() {
		return parentPrice;
	}

	public void setParentPrice(int parentPrice) {
		this.parentPrice = parentPrice;
	}

	public int getComfirmQuantity() {
		return comfirmQuantity;
	}

	public void setComfirmQuantity(int comfirmQuantity) {
		this.comfirmQuantity = comfirmQuantity;
	}

	public int getOutsourcingUnitPrice() {
		return outsourcingUnitPrice;
	}

	public void setOutsourcingUnitPrice(int outsourcingUnitPrice) {
		this.outsourcingUnitPrice = outsourcingUnitPrice;
	}


}
