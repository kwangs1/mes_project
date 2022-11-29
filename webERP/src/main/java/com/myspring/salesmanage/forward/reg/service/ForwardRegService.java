package com.myspring.salesmanage.forward.reg.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.salesmanage.cor.vo.CorVO;
import com.myspring.salesmanage.forward.vo.ForwardVO;

public interface ForwardRegService {

	//pop1 cust
	public List listCusts() throws DataAccessException;
	//pop2
	public List listItems() throws DataAccessException;
	//list by forward regstration
	public List submitCust(String general_Customer_Code) throws DataAccessException;
	public List listSupForward() throws DataAccessException;
	//list by forward regstration
	public List submitCustByInsert(String custCode) throws DataAccessException;
	//add by forward
	public int addForward(ForwardVO forwardVO) throws DataAccessException;
	//delete by forward 
	public void removeForward(String[] noary) throws DataAccessException;
	//update by forward ins
	public int updForward(ForwardVO forwardVO) throws DataAccessException;
	
	public List<CorVO> submitItemInfo(String relCode) throws DataAccessException;
	public int addForwardItem(CorVO corVO)throws DataAccessException;
	public List listForwardsub() throws DataAccessException;
	public void removeSubItem(String[] noary) throws DataAccessException;
	public int updSubItem(CorVO corVO) throws DataAccessException;
}
