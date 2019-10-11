package com.shop.shopping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.shopping.DAO.ShoppingDAO;
import com.shop.shopping.VO.ItemVO;

@Service
public class ShoppingService {

	@Autowired
	ShoppingDAO shoppingDAO;

	public List<ItemVO> getItemlist(Map<String, Object> map) throws Exception {
		return shoppingDAO.getItemlist(map);
	}

	public int getTotalListCount(String search) throws Exception {
		return shoppingDAO.getTotalListCount(search);
	}
}
