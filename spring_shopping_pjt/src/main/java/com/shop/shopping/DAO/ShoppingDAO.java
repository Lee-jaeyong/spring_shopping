package com.shop.shopping.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shop.shopping.VO.ItemVO;

public interface ShoppingDAO {
	public ItemVO selectItem(int i_idx) throws Exception;

	public List<ItemVO> getItemlist(Map<String, Object> map) throws Exception;

	public List<HashMap<String, Object>> getItemlistAll() throws Exception;

	public int getTotalListCount(String search) throws Exception;

	public boolean addItem(Map<String, Object> map) throws Exception;

	public boolean deleteItem(int i_idx) throws Exception;

	public boolean updateItem(Map<String, Object> map) throws Exception;

	public List<HashMap<String, Object>> stockItem(int i_idx) throws Exception;

	public boolean updateStock(Map<String, String> map) throws Exception;

	public boolean addColorAndSize(Map<String, String> map) throws Exception;

	public boolean addStock() throws Exception;

	public boolean deleteColorAndSize(int i_idx) throws Exception;

	public boolean deleteStock(int i_idx) throws Exception;
}
