package com.shop.shopping.DAO;

import java.util.List;
import java.util.Map;

import com.shop.shopping.VO.OrderVO;

public interface OrderDAO {
	public List<OrderVO> getOrderList(Map<String, Object> map) throws Exception;

	public int getOrderCount(String search) throws Exception;
}
