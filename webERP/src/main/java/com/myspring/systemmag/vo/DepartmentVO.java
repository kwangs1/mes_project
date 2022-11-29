package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("DepartmentVO")
public class DepartmentVO {
//부서등록
	private String department_Code ;
	private String department_Name ;
	private String workplace_Code;
	private String workplace_Name;
	private String sector_Code ;
	private String sector_Name;
	private Date usedate;
	private List<DepartmentVO> ListVO;
	public String getDepartment_Code() {
		return department_Code;
	}
	public void setDepartment_Code(String department_Code) {
		this.department_Code = department_Code;
	}
	public String getDepartment_Name() {
		return department_Name;
	}
	public void setDepartment_Name(String department_Name) {
		this.department_Name = department_Name;
	}
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
	public String getSector_Code() {
		return sector_Code;
	}
	public void setSector_Code(String sector_Code) {
		this.sector_Code = sector_Code;
	}
	public String getSector_Name() {
		return sector_Name;
	}
	public void setSector_Name(String sector_Name) {
		this.sector_Name = sector_Name;
	}
	public Date getUsedate() {
		return usedate;
	}
	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}
	public List<DepartmentVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<DepartmentVO> listVO) {
		ListVO = listVO;
	}
	
	
}
