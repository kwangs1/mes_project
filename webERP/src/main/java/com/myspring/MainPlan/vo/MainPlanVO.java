package com.myspring.MainPlan.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.MainPlan.MpsOS.vo.MpsOSVO;

@Component("mainplanVO")
public class MainPlanVO {
	private String planNO;
	private Date plandate;
	private String item_Code;
	private String item_Name;
	private String standard;
	private String inventory_unit;
	private int sequence;
	private Date expectedDate;
	private Date dueDate;
	private int plan_quantity;
	private String general_Customer_Name;
	private String note;
	private Date startDate;
	private Date endDate;	
	private List<MainPlanVO> ListVO;
	

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



	@Override
	public String toString() {return Arrays.toString(ListVO.toArray());}
	
	public MainPlanVO() {super();}
	
	public List<MainPlanVO> getListVO() {return ListVO;}
	public void setListVO(List<MainPlanVO> listVO) {ListVO = new ArrayList();}
		
	public Date getPlandate() {return plandate;}
	public void setPlandate(Date plandate) {this.plandate=plandate;}
	
	public String getItem_Code() {return item_Code;}
	public void setItem_Code(String item_Code) {this.item_Code=item_Code;}
	
	public String getItem_Name() {return item_Name;}
	public void setItem_Name(String item_Name) {this.item_Name= item_Name;}
	
	public String getStandard() {return standard;}
	public void setStandard(String standard) {this.standard=standard;}
	
	public String getInventory_unit() {return inventory_unit;}
	public void setInventory_unit(String inventory_unit) {this.inventory_unit=inventory_unit;}
	
	public int getSequence() {return sequence;}
	public void setSequence(int sequence) {this.sequence=sequence;}
	
	
	public Date getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getPlan_quantity() {return plan_quantity;}
	public void setPlan_quantity(int plan_quantity) {this.plan_quantity=plan_quantity;}
	
	
	public String getGeneral_Customer_Name() {
		return general_Customer_Name;
	}

	public void setGeneral_Customer_Name(String general_Customer_Name) {
		this.general_Customer_Name = general_Customer_Name;
	}

	public String getNote() {return note;}
	public void setNote(String note) {this.note=note;}
	
	public String getPlanNO() {return planNO;}
	public void setPlanNO(String planNO) {this.planNO=planNO;}
	
}
