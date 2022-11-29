package com.myspring.StockManage.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("StockManageVO")
public class StockManageVO {
	
	String 	moveNum;			//�̵���ȣ
	Date 	moveDate;			//�̵�����
	String 	outputPlace;		//������
	String 	outputBusiness;		//������
	String 	inputWarehouse;		//�԰�â��
	String 	inputPlace;			//�԰����
	String 	inputBusiness;			//�԰����
	String 	note;				//���
	String 	no;					//�ѹ�
	String 	itemCode;			//ǰ��
	String 	itemName;			//ǰ��
	String 	standard;			//�԰�
	String 	inventoryUnit;		//����
	int 	moveQuantity;		//�̵�����
	int 	movePrice;			//�̵��ܰ�
	String 	modNum;				//������ȣ
	Date 	modDate;			//��������
	String 	houseCode;			//â��
	String 	locationCode;		//���
	String 	kind;				//��������
	int 	modQuantity;		//��������
	String 	setCode;			//set��ǰ��ǰ��
	String 	inputQuantity;		//�԰���������
	String 	outputQuantity;		//�����������
	String 	purchasePrice;		//���Ŵܰ�
	String 	salesPrice;			//�ǸŴܰ�
	String 	type;			//�ǸŴܰ�
	String 	typeCode;			//�ǸŴܰ�
	String 	typeName;			//�ǸŴܰ�
	int quantity;	//������
	
	
	
	String 	busCode;
	String 	busName;
	java.util.Date startDate, endDate;
	
	private List<StockManageVO> StoVO;
	private List<StockManageVO> subListStoVO;
	private List<StockManageVO> updateListStoVO;
	

	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public List<StockManageVO> getUpdateListStoVO() {
		return updateListStoVO;
	}
	public void setUpdateListStoVO(List<StockManageVO> updateListStoVO) {
		this.updateListStoVO = updateListStoVO;
	}
	public List<StockManageVO> getSubListStoVO() {
		return subListStoVO;
	}
	public void setSubListStoVO(List<StockManageVO> subListStoVO) {
		this.subListStoVO = subListStoVO;
	}
	public String getOutputBusiness() {
		return outputBusiness;
	}
	public void setOutputBusiness(String outputBusiness) {
		this.outputBusiness = outputBusiness;
	}
	public String getInputBusiness() {
		return inputBusiness;
	}
	public void setInputBusiness(String inputBusiness) {
		this.inputBusiness = inputBusiness;
	}
	public String getBusCode() {
		return busCode;
	}
	public void setBusCode(String busCode) {
		this.busCode = busCode;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
	}
	
	public List<StockManageVO> getStoVO() {
		return StoVO;
	}
	public void setStoVO(List<StockManageVO> stoVO) {
		StoVO = new ArrayList();
	}
	public String getMoveNum() {
		return moveNum;
	}
	public void setMoveNum(String moveNum) {
		this.moveNum = moveNum;
	}
	public Date getMoveDate() {
		return moveDate;
	}
	public void setMoveDate(Date moveDate) {
		this.moveDate = moveDate;
	}
	public String getOutputPlace() {
		return outputPlace;
	}
	public void setOutputPlace(String outputPlace) {
		this.outputPlace = outputPlace;
	}
	public String getInputWarehouse() {
		return inputWarehouse;
	}
	public void setInputWarehouse(String inputWarehouse) {
		this.inputWarehouse = inputWarehouse;
	}
	public String getInputPlace() {
		return inputPlace;
	}
	public void setInputPlace(String inputPlace) {
		this.inputPlace = inputPlace;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
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
	public int getMoveQuantity() {
		return moveQuantity;
	}
	public void setMoveQuantity(int moveQuantity) {
		this.moveQuantity = moveQuantity;
	}
	public int getMovePrice() {
		return movePrice;
	}
	public void setMovePrice(int movePrice) {
		this.movePrice = movePrice;
	}
	public String getModNum() {
		return modNum;
	}
	public void setModNum(String modNum) {
		this.modNum = modNum;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getModQuantity() {
		return modQuantity;
	}
	public void setModQuantity(int modQuantity) {
		this.modQuantity = modQuantity;
	}
	public String getSetCode() {
		return setCode;
	}
	public void setSetCode(String setCode) {
		this.setCode = setCode;
	}
	public String getInputQuantity() {
		return inputQuantity;
	}
	public void setInputQuantity(String inputQuantity) {
		this.inputQuantity = inputQuantity;
	}
	public String getOutputQuantity() {
		return outputQuantity;
	}
	public void setOutputQuantity(String outputQuantity) {
		this.outputQuantity = outputQuantity;
	}
	public String getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(String purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public String getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(String salesPrice) {
		this.salesPrice = salesPrice;
	}
	
	public java.util.Date getStartDate() {
		return startDate;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}
	public java.util.Date getEndDate() {
		return endDate;
	}
	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}
	
	
	// ���ֵ�� ��Ʈ
	String ordersNum;
	Date   ordersdate;
	String general_Customer_Code;
	String general_Customer_Name;
	


	public String getGeneral_Customer_Code() {
		return general_Customer_Code;
	}
	public void setGeneral_Customer_Code(String general_Customer_Code) {
		this.general_Customer_Code = general_Customer_Code;
	}
	public String getGeneral_Customer_Name() {
		return general_Customer_Name;
	}
	public void setGeneral_Customer_Name(String general_Customer_Name) {
		this.general_Customer_Name = general_Customer_Name;
	}


	String tax;
	String code;
	Date	dueDate;
	String ordersQuantity;
	int productPrice;
	int vatPrice;
	Date expectedDate;
	String inspection;
	String insertNo;
	
	
	
	public String getInsertNo() {
		return insertNo;
	}
	public void setInsertNo(String insertNo) {
		this.insertNo = insertNo;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getOrdersQuantity() {
		return ordersQuantity;
	}
	public void setOrdersQuantity(String ordersQuantity) {
		this.ordersQuantity = ordersQuantity;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getVatPrice() {
		return vatPrice;
	}
	public void setVatPrice(int vatPrice) {
		this.vatPrice = vatPrice;
	}
	public Date getExpectedDate() {
		return expectedDate;
	}
	public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}
	public String getInspection() {
		return inspection;
	}
	public void setInspection(String inspection) {
		this.inspection = inspection;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}


	private List<StockManageVO> sujuVO;
	private List<StockManageVO> subSujuList;

	public List<StockManageVO> getSubSujuList() {
		return subSujuList;
	}
	public void setSubSujuList(List<StockManageVO> subSujuList) {
		this.subSujuList = subSujuList;
	}
	public List<StockManageVO> getSujuVO() {
		return sujuVO;
	}
	public void setSujuVO(List<StockManageVO> sujuVO) {
		this.sujuVO = sujuVO;
	}
	public String getOrdersNum() {
		return ordersNum;
	}
	public void setOrdersNum(String ordersNum) {
		this.ordersNum = ordersNum;
	}
	public Date getOrdersdate() {
		return ordersdate;
	}
	public void setOrdersdate(Date ordersdate) {
		this.ordersdate = ordersdate;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	///////// �޴��˻���
	
	String menu;
	String url;
	

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	

	
}
