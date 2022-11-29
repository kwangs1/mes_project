package com.myspring.outsourcing_manage.RegOutPerformance.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;
@Component("RegOutPerformanceVO")
public class RegOutPerformanceVO {
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
	private int sumPerformanceQuantity;
	private int remainingPerformance;
	private String status;
	private String parentInspection;
	private String parentNote;
	private String productionPlanCode;	
	
	private String operationPerformanceNumber;
	private String materialUseStatus;
	private Date performanceDate;
	private String outsourcingCode;
	private String sortation;
	private String performanceQuantity;
	private String inspection;
	private String note;
	
	private List<RegOutPerformanceVO> ListVO;
	
	public String getWorkOrderNumber() {
		return workOrderNumber;
	}
	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
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
	public int getParentPrice() {
		return parentPrice;
	}
	public void setParentPrice(int parentPrice) {
		this.parentPrice = parentPrice;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getParentInspection() {
		return parentInspection;
	}
	public void setParentInspection(String parentInspection) {
		this.parentInspection = parentInspection;
	}
	public String getParentNote() {
		return parentNote;
	}
	public void setParentNote(String parentNote) {
		this.parentNote = parentNote;
	}
	public String getProductionPlanCode() {
		return productionPlanCode;
	}
	public void setProductionPlanCode(String productionPlanCode) {
		this.productionPlanCode = productionPlanCode;
	}
	public String getOperationPerformanceNumber() {
		return operationPerformanceNumber;
	}
	public void setOperationPerformanceNumber(String operationPerformanceNumber) {
		this.operationPerformanceNumber = operationPerformanceNumber;
	}
	public String getMaterialForwardingStatus() {
		return materialForwardingStatus;
	}
	public void setMaterialForwardingStatus(String materialForwardingStatus) {
		this.materialForwardingStatus = materialForwardingStatus;
	}
	public Date getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(Date performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getOutsourcingCode() {
		return outsourcingCode;
	}
	public void setOutsourcingCode(String outsourcingCode) {
		this.outsourcingCode = outsourcingCode;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	public String getPerformanceQuantity() {
		return performanceQuantity;
	}
	public void setPerformanceQuantity(String performanceQuantity) {
		this.performanceQuantity = performanceQuantity;
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
	public List<RegOutPerformanceVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<RegOutPerformanceVO> listVO) {
		ListVO = listVO;
	}
	public String getMaterialUseStatus() {
		return materialUseStatus;
	}
	public void setMaterialUseStatus(String materialUseStatus) {
		this.materialUseStatus = materialUseStatus;
	}
	
	
}
