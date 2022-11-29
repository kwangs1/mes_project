package com.myspring.commonProduction.workInProcess.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.commonProduction.commitOperationInstruction.vo.CommitOperationInstructionVO;

public interface WorkInProcessDAO {

	public List WorkInProcess() throws DataAccessException;
	public List WorkInProcessCondition(String itemCode) throws DataAccessException;


}
