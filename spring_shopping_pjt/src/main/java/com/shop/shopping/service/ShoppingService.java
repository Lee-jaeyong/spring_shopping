package com.shop.shopping.service;

import java.util.HashMap;
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

	public boolean addItem(Map<String, Object> map) throws Exception {
		return shoppingDAO.addItem(map);
	}

	public List<HashMap<String, Object>> getItemlistAll() throws Exception {
		return shoppingDAO.getItemlistAll();
	}

	public boolean deleteItem(int i_idx) throws Exception {
		return shoppingDAO.deleteItem(i_idx);
	}

	public ItemVO selectItem(int i_idx) throws Exception {
		return shoppingDAO.selectItem(i_idx);
	}

	public boolean updateItem(Map<String, Object> map) throws Exception {
		return shoppingDAO.updateItem(map);
	}

	public List<HashMap<String, Object>> stockItem(int i_idx) throws Exception {
		return shoppingDAO.stockItem(i_idx);
	}

	public boolean updateStock(Map<String, String> map) throws Exception {
		return shoppingDAO.updateStock(map);
	}

	public boolean addColorAndSize(Map<String, String> map) throws Exception {
		return shoppingDAO.addColorAndSize(map);
	}
	
	public boolean addStock() throws Exception{
		return shoppingDAO.addStock();
	}
	
	public boolean deleteColorAndSize(int i_idx) throws Exception{
		return shoppingDAO.deleteColorAndSize(i_idx);
	}

	public boolean deleteStock(int i_idx) throws Exception{
		return shoppingDAO.deleteStock(i_idx);
	}
}
