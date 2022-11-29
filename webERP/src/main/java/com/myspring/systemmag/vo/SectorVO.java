package com.myspring.systemmag.vo;

import java.sql.Date;
import java.util.List;

public class SectorVO {
	private String sector_Code;
	private String sector_Name;
	private Date useDate;
	
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
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}
	public List<ZipcodeVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<ZipcodeVO> listVO) {
		ListVO = listVO;
	}
	private List<ZipcodeVO> ListVO;
	
	
	
	
}
