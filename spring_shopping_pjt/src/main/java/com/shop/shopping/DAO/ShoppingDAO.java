package com.shop.shopping.DAO;

import java.util.List;
import java.util.Map;

import com.shop.shopping.VO.ItemVO;

public interface ShoppingDAO {
	public List<ItemVO> getItemlist(Map<String, Object> map) throws Exception;

	public int getTotalListCount(String search) throws Exception;
}
