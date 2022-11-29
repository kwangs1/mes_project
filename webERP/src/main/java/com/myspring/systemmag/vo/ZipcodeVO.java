package com.myspring.systemmag.vo;

import java.util.List;

public class ZipcodeVO {
	private String zipcode;
	private String road_address;
	private String lot_address;
	private List<ZipcodeVO> ListVO;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getLot_address() {
		return lot_address;
	}
	public void setLot_address(String lot_address) {
		this.lot_address = lot_address;
	}
	public List<ZipcodeVO> getListVO() {
		return ListVO;
	}
	public void setListVO(List<ZipcodeVO> listVO) {
		ListVO = listVO;
	}
}
