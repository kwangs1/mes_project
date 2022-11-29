package com.myspring.Login.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.Login.vo.LoginVO;

public interface LoginDAO {

	List depView() throws DataAccessException;

	List empView(String depCode) throws DataAccessException;

	LoginVO loginList(LoginVO vo) throws DataAccessException;

}
