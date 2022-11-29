package com.myspring.productionBaseInfo.BOM.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component("bomVO")
public class bomVO {
	private int no;
	private String parent;
	private String itemNumber;
	private String itemName;
	private String standard;
	private String unit;
	private int precisionQuantity;
	private int loss;
	private String actualQuantity;
	private int actualCost;
	private int outSourcingUnitPrice;
	private Date startDate;
	private Date endDate;
	private String division;
	private String outsourcing_code;
	private String workplace_code;
	private String cost;
	private List<bomVO> ListVO;
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
	}
	public bomVO() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
	public int getActualCost() {
		return actualCost;
	}
	public void setActualCost(int actualCost) {
		this.actualCost = actualCost;
	}
	public int getOutSourcingUnitPrice() {
		return outSourcingUnitPrice;
	}
	public void setOutSourcingUnitPrice(int outSourcingUnitPrice) {
		this.outSourcingUnitPrice = outSourcingUnitPrice;
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
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getActualQuantity() {
		return actualQuantity;
	}
	public void setActualQuantity(String actualQuantity) {
		this.actualQuantity = actualQuantity;
	}
	public List<bomVO> getListVO() {
		return ListVO;
	}
	
	public void setListVO(List<bomVO> listVO) {
		ListVO = listVO;
	}
	public String getOutsourcing_code() {
		return outsourcing_code;
	}
	public void setOutsourcing_code(String outsourcing_code) {
		this.outsourcing_code = outsourcing_code;
	}
	public String getWorkplace_code() {
		return workplace_code;
	}
	public void setWorkplace_code(String workplace_code) {
		this.workplace_code = workplace_code;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
}
