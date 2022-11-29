package com.myspring.businessStatus.releaseStatus.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("rsjVO")
public class rsjVO {
	private String releaseNum ; //출고번호
	private Date releaseDate ; //출고일자
	private String customerCode; //고객
	private List<rsjVO> jListVO;
	
	@Override
	public String toString() {
		return Arrays.toString(jListVO.toArray());
	}
	
	public rsjVO() {
		super();
	}

	public String getReleaseNum() {
		return releaseNum;
	}

	public void setReleaseNum(String releaseNum) {
		this.releaseNum = releaseNum;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public List<rsjVO> getjListVO() {
		return jListVO;
	}

	public void setjListVO(List<rsjVO> jListVO) {
		this.jListVO = jListVO;
	}

}
