package com.myspring.outsourcing_manage.OutRelease.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;


@Component("OutReleaseVO")

public class OutReleaseVO {
	private String forwardingNumber;
	private Date forwardingDate;
	private String houseCode;
	private String houseName;
	private String locationCode;
	private String locationName;
	private String outsourcingCode;
	private String outsourcingName;
	private String workplaceCode;
	private String workplaceName;
	private String note;
	
	private int no;
	private Date billingDate;
	private String itemCode;
	private String itemName;
	private String standard;
	private String inventoryUnit;
	private int precisionQuantity;
	private int forwardingQuantity;
	private String noteDetail;
	private String workOrderNumber;
	private List<OutReleaseVO> ListVO;
	
	public String getForwardingNumber() {
		return forwardingNumber;
	}
	public void setForwardingNumber(String forwardingNumber) {
		this.forwardingNumber = forwardingNumber;
	}
	public Date getForwardingDate() {
		return forwardingDate;
	}
	public void setForwardingDate(Date forwardingDate) {
		this.forwardingDate = forwardingDate;
	}
	public String getHouseCode() {
		return houseCode;
	}
	public void setHouseCode(String houseCode) {
		this.houseCode = houseCode;
	}
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}
	public String getOutsourcingCode() {
		return outsourcingCode;
	}
	public void setOutsourcingCode(String outsourcingCode) {
		this.outsourcingCode = outsourcingCode;
	}
	public String getWorkplaceCode() {
		return workplaceCode;
	}
	public void setWorkplaceCode(String workplaceCode) {
		this.workplaceCode = workplaceCode;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public List<OutReleaseVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<OutReleaseVO> listVO) {
		ListVO = listVO;
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
	public int getPrecisionQuantity() {
		return precisionQuantity;
	}
	public void setPrecisionQuantity(int precisionQuantity) {
		this.precisionQuantity = precisionQuantity;
	}

	public String getNoteDetail() {
		return noteDetail;
	}
	public void setNoteDetail(String noteDetail) {
		this.noteDetail = noteDetail;
	}
	public int getForwardingQuantity() {
		return forwardingQuantity;
	}
	public void setForwardingQuantity(int forwardingQuantity) {
		this.forwardingQuantity = forwardingQuantity;
	}
	public Date getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getOutsourcingName() {
		return outsourcingName;
	}
	public void setOutsourcingName(String outsourcingName) {
		this.outsourcingName = outsourcingName;
	}
	public String getWorkplaceName() {
		return workplaceName;
	}
	public void setWorkplaceName(String workplaceName) {
		this.workplaceName = workplaceName;
	}
	public String getWorkOrderNumber() {
		return workOrderNumber;
	}
	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}
	
	
	
}
