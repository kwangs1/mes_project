package com.myspring.Requiredamount.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.MainPlan.vo.MainPlanVO;
import com.myspring.productionBaseInfo.BOM.vo.bomVO;

@Component("mrpVO")
public class RequiredamountVO {
private String item_Code;
private String item_Name;
private String standard;
private Date dueDate;
private int sequence;
private Date expectedDate;
private int expected_quantity;
private String inventory_unit;
private List<RequiredamountVO> ListVO;
private bomVO bomVO;
private MainPlanVO mainplanVO;


@Override
public String toString() {return Arrays.toString(ListVO.toArray());}

public RequiredamountVO() {super();}

public List<RequiredamountVO> getListVO() {return ListVO;}
public void setListVO(List<RequiredamountVO> listVO) {ListVO = new ArrayList();}

public String getItem_Code() {return item_Code;}
public void setItem_Code(String item_Code) {this.item_Code=item_Code;}

public String getItem_Name() {return item_Name;}
public void setItem_Name(String item_Name) {this.item_Name=item_Name;}

public String getStandard() {return standard;}
public void setStandard(String standard) {this.standard=standard;}


public Date getDueDate() {
	return dueDate;
}

public void setDueDate(Date dueDate) {
	this.dueDate = dueDate;
}

public int getSequence() {return sequence;}
public void setSequence(int sequence) {this.sequence=sequence;}



public Date getExpectedDate() {
	return expectedDate;
}

public void setExpectedDate(Date expectedDate) {
	this.expectedDate = expectedDate;
}

public int getExpected_quantity() {return expected_quantity;}
public void setExpected_quantity(int expected_quantity) {this.expected_quantity=expected_quantity;}

public String getInventory_unit() {return inventory_unit;}
public void setInventory_unit(String inventory_unit) {this.inventory_unit=inventory_unit;}

public bomVO getBomVO() {
	return bomVO;
}

public void setBomVO(bomVO bomVO) {
	this.bomVO = bomVO;
}

public MainPlanVO getMainplanVO() {
	return mainplanVO;
}

public void setMainplanVO(MainPlanVO mainplanVO) {
	this.mainplanVO = mainplanVO;
}


}
