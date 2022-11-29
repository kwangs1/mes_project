package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("ItemgVO")
public class ItemgVO {
//품목군등록
	private String item_Group_Code;
	private String item_Group_Name;
	private String use_Status;
	private String explanation;
	private String div1;
	private List<ItemgVO> ListVO;
	
	
	public String getItem_Group_Code() {
		return item_Group_Code;
	}
	public void setItem_Group_Code(String item_Group_Code) {
		this.item_Group_Code = item_Group_Code;
	}
	public String getItem_Group_Name() {
		return item_Group_Name;
	}
	public void setItem_Group_Name(String item_Group_Name) {
		this.item_Group_Name = item_Group_Name;
	}
	public String getUse_Status() {
		return use_Status;
	}
	public void setUse_Status(String use_Status) {
		this.use_Status = use_Status;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public List<ItemgVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<ItemgVO> listVO) {
		ListVO = listVO;
	}
	public String getDiv1() {
		return div1;
	}
	public void setDiv1(String div1) {
		this.div1 = div1;
	}
	
	
	}

