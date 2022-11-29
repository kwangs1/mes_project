package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("EmployeeVO")
public class EmployeeVO {
	private String employee_Code;
	private String employee_Name;
	private String department_Code;
	private String department_Name;
	private Date joinDate;
	private Date resignationDate;
	private String emergency_Contact_Network;
	private List<EmployeeVO> ListVO;
	
	public String getEmployee_Code() {
		return employee_Code;
	}
	public void setEmployee_Code(String employee_Code) {
		this.employee_Code = employee_Code;
	}
	public String getEmployee_Name() {
		return employee_Name;
	}
	public void setEmployee_Name(String employee_Name) {
		this.employee_Name = employee_Name;
	}
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
	public String getEmergency_Contact_Network() {
		return emergency_Contact_Network;
	}
	public void setEmergency_Contact_Network(String emergency_Contact_Network) {
		this.emergency_Contact_Network = emergency_Contact_Network;
	}
	public List<EmployeeVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<EmployeeVO> listVO) {
		ListVO = listVO;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getResignationDate() {
		return resignationDate;
	}
	public void setResignationDate(Date resignationDate) {
		this.resignationDate = resignationDate;
	}
}
