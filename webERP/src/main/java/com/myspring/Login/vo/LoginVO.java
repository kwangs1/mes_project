package com.myspring.Login.vo;

import org.springframework.stereotype.Component;

@Component("loginVO")
public class LoginVO {
	private String dep_Code;
	private String dep_Name;
	private String emp_Code;
	private String emp_Name;
	private String password;
	
	public String getDep_Code() {
		return dep_Code;
	}
	public void setDep_Code(String dep_Code) {
		this.dep_Code = dep_Code;
	}
	public String getDep_Name() {
		return dep_Name;
	}
	public void setDep_Name(String dep_Name) {
		this.dep_Name = dep_Name;
	}
	public String getEmp_Code() {
		return emp_Code;
	}
	public void setEmp_Code(String emp_Code) {
		this.emp_Code = emp_Code;
	}
	public String getEmp_Name() {
		return emp_Name;
	}
	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
