package com.shop.shopping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.shopping.DAO.OrderDAO;
import com.shop.shopping.VO.OrderVO;

@Service
public class OrderService {
	@Autowired
	OrderDAO orderDAO;

	public List<OrderVO> getOrderList(Map<String, Object> map) throws Exception {
		return orderDAO.getOrderList(map);
	}

	public int getOrderCount(String search) throws Exception {
		return orderDAO.getOrderCount(search);
	}
}
