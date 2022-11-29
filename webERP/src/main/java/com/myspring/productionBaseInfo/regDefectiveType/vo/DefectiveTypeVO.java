package com.myspring.productionBaseInfo.regDefectiveType.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("defVO")
public class DefectiveTypeVO {
	private String chkNum;
	private String defectCode;
	private String defectiveTypeName;
	private String defectiveItemGroupCode;
	private String defectiveItemGroup;
	private String usageStatus;
	private String defectiveDescription;
	private String oridefectCode;
	private List<DefectiveTypeVO> defList;
	public String getDefectCode() {
		return defectCode;
	}
	public void setDefectCode(String defectCode) {
		this.defectCode = defectCode;
	}
	public String getDefectiveTypeName() {
		return defectiveTypeName;
	}
	public void setDefectiveTypeName(String defectiveTypeName) {
		this.defectiveTypeName = defectiveTypeName;
	}
	public String getDefectiveItemGroupCode() {
		return defectiveItemGroupCode;
	}
	public void setDefectiveItemGroupCode(String defectiveItemGroupCode) {
		this.defectiveItemGroupCode = defectiveItemGroupCode;
	}
	public String getDefectiveItemGroup() {
		return defectiveItemGroup;
	}
	public void setDefectiveItemGroup(String defectiveItemGroup) {
		this.defectiveItemGroup = defectiveItemGroup;
	}
	public String getUsageStatus() {
		return usageStatus;
	}
	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}
	public String getDefectiveDescription() {
		return defectiveDescription;
	}
	public void setDefectiveDescription(String defectiveDescription) {
		this.defectiveDescription = defectiveDescription;
	}
	public List<DefectiveTypeVO> getDefList() {
		return defList;
	}
	public void setDefList(List<DefectiveTypeVO> defList) {
		this.defList = defList;
	}
	public String getOridefectCode() {
		return oridefectCode;
	}
	public void setOridefectCode(String oridefectCode) {
		this.oridefectCode = oridefectCode;
	}
	public String getChkNum() {
		return chkNum;
	}
	public void setChkNum(String chkNum) {
		this.chkNum = chkNum;
	}
	
	
}
