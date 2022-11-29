package com.myspring.commonProduction.operationInsClosing.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("itemVO")
public class itemVO {
	private String item_Code;
	private String item_Name;
	private String standard;
	private String inventory_Unit;
	private String whether_LOT;
	private String sET_Item;
	private String inspection_Status;
	private String use_Status;
	private String lOT_Quantity;
	private String drawing_Number;
	private String hs_Code;
	private String width;
	private String length;
	private String height;
	private String cost;
	private String item_Group_Code;
	private String division;
	private String notes;
	private String daily_production;
	private List<itemVO> ListVO;
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getItem_Code() {
		return item_Code;
	}
	public void setItem_Code(String item_Code) {
		this.item_Code = item_Code;
	}
	public String getItem_Name() {
		return item_Name;
	}
	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getInventory_Unit() {
		return inventory_Unit;
	}
	public void setInventory_Unit(String inventory_Unit) {
		this.inventory_Unit = inventory_Unit;
	}
	public String getWhether_LOT() {
		return whether_LOT;
	}
	public void setWhether_LOT(String whether_LOT) {
		this.whether_LOT = whether_LOT;
	}
	public String getsET_Item() {
		return sET_Item;
	}
	public void setsET_Item(String sET_Item) {
		this.sET_Item = sET_Item;
	}
	public String getInspection_Status() {
		return inspection_Status;
	}
	public void setInspection_Status(String inspection_Status) {
		this.inspection_Status = inspection_Status;
	}
	public String getUse_Status() {
		return use_Status;
	}
	public void setUse_Status(String use_Status) {
		this.use_Status = use_Status;
	}
	public String getlOT_Quantity() {
		return lOT_Quantity;
	}
	public void setlOT_Quantity(String lOT_Quantity) {
		this.lOT_Quantity = lOT_Quantity;
	}
	public String getDrawing_Number() {
		return drawing_Number;
	}
	public void setDrawing_Number(String drawing_Number) {
		this.drawing_Number = drawing_Number;
	}
	public String getHs_Code() {
		return hs_Code;
	}
	public void setHs_Code(String hs_Code) {
		this.hs_Code = hs_Code;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getItem_Group_Code() {
		return item_Group_Code;
	}
	public void setItem_Group_Code(String item_Group_Code) {
		this.item_Group_Code = item_Group_Code;
	}
	
	public String getDaily_production() {
		return daily_production;
	}
	public void setDaily_production(String daily_production) {
		this.daily_production = daily_production;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public List<itemVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<itemVO> listVO) {
		ListVO = listVO;
	}
	
}