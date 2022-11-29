package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("WorkplaceVO")
public class WorkplaceVO {
	//사업장 등록
	private String workplace_Code;
	private String workplace_Name ;
	private String worcompany_Registration_Number;
	private String worcorporate_Registration_Number;
	private String worrepresentatives_Name;
	private String workplace_Zipcode;
	private String workplace_Address;
	private String workplace_Number;
	private String workplace_Tel;
	private String worupstate;
	private String worindustry;
	private String main_Store_Status;
	private List<WorkplaceVO> ListVO;
	
	public String getWorkplace_Code() {
		return workplace_Code;
	}
	public void setWorkplace_Code(String workplace_Code) {
		this.workplace_Code = workplace_Code;
	}
	public String getWorkplace_Name() {
		return workplace_Name;
	}
	public void setWorkplace_Name(String workplace_Name) {
		this.workplace_Name = workplace_Name;
	}
	public String getWorcompany_Registration_Number() {
		return worcompany_Registration_Number;
	}
	public void setWorcompany_Registration_Number(String worcompany_Registration_Number) {
		this.worcompany_Registration_Number = worcompany_Registration_Number;
	}
	public String getWorcorporate_Registration_Number() {
		return worcorporate_Registration_Number;
	}
	public void setWorcorporate_Registration_Number(String worcorporate_Registration_Number) {
		this.worcorporate_Registration_Number = worcorporate_Registration_Number;
	}
	public String getWorrepresentatives_Name() {
		return worrepresentatives_Name;
	}
	public void setWorrepresentatives_Name(String worrepresentatives_Name) {
		this.worrepresentatives_Name = worrepresentatives_Name;
	}
	public String getWorkplace_Zipcode() {
		return workplace_Zipcode;
	}
	public void setWorkplace_Zipcode(String workplace_Zipcode) {
		this.workplace_Zipcode = workplace_Zipcode;
	}
	public String getWorkplace_Address() {
		return workplace_Address;
	}
	public void setWorkplace_Address(String workplace_Address) {
		this.workplace_Address = workplace_Address;
	}
	public String getWorkplace_Number() {
		return workplace_Number;
	}
	public void setWorkplace_Number(String workplace_Number) {
		this.workplace_Number = workplace_Number;
	}
	public String getWorkplace_Tel() {
		return workplace_Tel;
	}
	public void setWorkplace_Tel(String workplace_Tel) {
		this.workplace_Tel = workplace_Tel;
	}
	public String getWorupstate() {
		return worupstate;
	}
	public void setWorupstate(String worupstate) {
		this.worupstate = worupstate;
	}
	public String getWorindustry() {
		return worindustry;
	}
	public void setWorindustry(String worindustry) {
		this.worindustry = worindustry;
	}
	public String getMain_Store_Status() {
		return main_Store_Status;
	}
	public void setMain_Store_Status(String main_Store_Status) {
		this.main_Store_Status = main_Store_Status;
	}
	public List<WorkplaceVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<WorkplaceVO> listVO) {
		ListVO = listVO;
	}
	
}
	