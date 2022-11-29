package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("SystemmagVO")
public class SystemmagVO {
	//회사 등록
	private String company_Code;
	private String company_Name;
	private String sortation;
	private String fiscal_Year_Number;
	private Date fiscal_Year_Dates;
	private Date fiscal_Year_Datee;
	private String company_Registration_Number;
	private String corporate_Registration_Number;
	private String representatives_Name;
	private String resident_Registration_Number;
	private String main_Store_Postal_Code;
	private String main_Store_Address;
	private String main_Branch_Number;
	private String main_Store_Tel;
	private String upstate;
	private String industry;
	private Date date_Of_Establishment;
	private String whether_To_Use_Status;
	
	public String getCompany_Code() {
		return company_Code;
	}
	public void setCompany_Code(String company_Code) {
		this.company_Code = company_Code;
	}
	public String getCompany_Name() {
		return company_Name;
	}
	public void setCompany_Name(String company_Name) {
		this.company_Name = company_Name;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	public String getFiscal_Year_Number() {
		return fiscal_Year_Number;
	}
	public void setFiscal_Year_Number(String fiscal_Year_Number) {
		this.fiscal_Year_Number = fiscal_Year_Number;
	}
	public Date getFiscal_Year_Dates() {
		return fiscal_Year_Dates;
	}
	public void setFiscal_Year_Dates(Date fiscal_Year_Dates) {
		this.fiscal_Year_Dates = fiscal_Year_Dates;
	}
	public Date getFiscal_Year_Datee() {
		return fiscal_Year_Datee;
	}
	public void setFiscal_Year_Datee(Date fiscal_Year_Datee) {
		this.fiscal_Year_Datee = fiscal_Year_Datee;
	}
	public String getCompany_Registration_Number() {
		return company_Registration_Number;
	}
	public void setCompany_Registration_Number(String company_Registration_Number) {
		this.company_Registration_Number = company_Registration_Number;
	}
	public String getCorporate_Registration_Number() {
		return corporate_Registration_Number;
	}
	public void setCorporate_Registration_Number(String corporate_Registration_Number) {
		this.corporate_Registration_Number = corporate_Registration_Number;
	}
	public String getRepresentatives_Name() {
		return representatives_Name;
	}
	public void setRepresentatives_Name(String representatives_Name) {
		this.representatives_Name = representatives_Name;
	}
	public String getResident_Registration_Number() {
		return resident_Registration_Number;
	}
	public void setResident_Registration_Number(String resident_Registration_Number) {
		this.resident_Registration_Number = resident_Registration_Number;
	}
	public String getMain_Store_Postal_Code() {
		return main_Store_Postal_Code;
	}
	public void setMain_Store_Postal_Code(String main_Store_Postal_Code) {
		this.main_Store_Postal_Code = main_Store_Postal_Code;
	}
	public String getMain_Store_Address() {
		return main_Store_Address;
	}
	public void setMain_Store_Address(String main_Store_Address) {
		this.main_Store_Address = main_Store_Address;
	}
	public String getMain_Branch_Number() {
		return main_Branch_Number;
	}
	public void setMain_Branch_Number(String main_Branch_Number) {
		this.main_Branch_Number = main_Branch_Number;
	}
	public String getMain_Store_Tel() {
		return main_Store_Tel;
	}
	public void setMain_Store_Tel(String main_Store_Tel) {
		this.main_Store_Tel = main_Store_Tel;
	}
	public String getUpstate() {
		return upstate;
	}
	public void setUpstate(String upstate) {
		this.upstate = upstate;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public Date getDate_Of_Establishment() {
		return date_Of_Establishment;
	}
	public void setDate_Of_Establishment(Date date_Of_Establishment) {
		this.date_Of_Establishment = date_Of_Establishment;
	}
	public String getWhether_To_Use_Status() {
		return whether_To_Use_Status;
	}
	public void setWhether_To_Use_Status(String whether_To_Use_Status) {
		this.whether_To_Use_Status = whether_To_Use_Status;
	}
}