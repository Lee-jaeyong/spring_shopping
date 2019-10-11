package com.shop.shopping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.shopping.DAO.UserDAO;
import com.shop.shopping.VO.UserVO;

@Service
public class UserService {

	@Autowired
	UserDAO userDAO;

	public List<UserVO> getUserList(Map<String, Object> map) throws Exception {
		return userDAO.getUserList(map);
	}

	public int getTotalUser(String search) throws Exception {
		return userDAO.getTotalUser(search);
	}

}
