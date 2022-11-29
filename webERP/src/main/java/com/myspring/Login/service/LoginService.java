package com.myspring.Login.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.Login.vo.LoginVO;

public interface LoginService {

	List depView() throws DataAccessException;

	List empView(String depCode) throws DataAccessException;

	LoginVO login(LoginVO vo) throws DataAccessException;

}
