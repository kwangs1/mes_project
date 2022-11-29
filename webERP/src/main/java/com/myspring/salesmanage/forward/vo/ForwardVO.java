package com.myspring.salesmanage.forward.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.myspring.salesmanage.cor.vo.CorVO;


@Component("forwardVO")
public class ForwardVO {

	private String relCode;
	private Date relDate;
	private String general_Customer_Code;
	private String general_Customer_Name;
	private String company_Registration_Number;
	private String releaseOX;
	private String deadLine;
	private String note;

	private List<ForwardVO> ListVO;
	private CorVO corVO;
	
	
	@Override
	public String toString() {
		return Arrays.toString(ListVO.toArray());
	}	

	public ForwardVO() {
		super();
	}

	public String getRelCode() {
		return relCode;
	}

	public void setRelCode(String relCode) {
		this.relCode = relCode;
	}

	public Date getRelDate() {
		return relDate;
	}

	public void setRelDate(Date relDate) {
		this.relDate = relDate;
	}

	public String getGeneral_Customer_Code() {
		return general_Customer_Code;
	}

	public void setGeneral_Customer_Code(String general_Customer_Code) {
		this.general_Customer_Code = general_Customer_Code;
	}

	public String getGeneral_Customer_Name() {
		return general_Customer_Name;
	}

	public void setGeneral_Customer_Name(String general_Customer_Name) {
		this.general_Customer_Name = general_Customer_Name;
	}

	public String getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public List<ForwardVO> getListVO() {
		return ListVO;
	}

	public void setListVO(List<ForwardVO> listVO) {
		ListVO = listVO;
	}

	public CorVO getCorVO() {
		return corVO;
	}

	public void setCorVO(CorVO corVO) {
		this.corVO = corVO;
	}

	public String getCompany_Registration_Number() {
		return company_Registration_Number;
	}

	public void setCompany_Registration_Number(String company_Registration_Number) {
		this.company_Registration_Number = company_Registration_Number;
	}

	public String getReleaseOX() {
		return releaseOX;
	}

	public void setReleaseOX(String releaseOX) {
		this.releaseOX = releaseOX;
	}


}
