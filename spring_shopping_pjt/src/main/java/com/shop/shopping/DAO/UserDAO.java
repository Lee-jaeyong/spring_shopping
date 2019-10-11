package com.shop.shopping.DAO;

import java.util.List;
import java.util.Map;

import com.shop.shopping.VO.UserVO;

public interface UserDAO {
	public List<UserVO> getUserList(Map<String, Object> map) throws Exception;
	public int getTotalUser(String search) throws Exception;
}
