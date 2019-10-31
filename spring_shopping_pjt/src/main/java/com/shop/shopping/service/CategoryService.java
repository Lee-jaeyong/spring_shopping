package com.shop.shopping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.shopping.DAO.CategoryDAO;
import com.shop.shopping.VO.CategoryVO;

@Service
public class CategoryService {
	@Autowired
	CategoryDAO categoryDAO;

	public List<CategoryVO> getC_Category() throws Exception {
		return categoryDAO.getC_Category();
	}

	public List<CategoryVO> getCsCategoryList(int category) throws Exception {
		return categoryDAO.getCsCategoryList(category);
	}

	public int addCcategory(String category) throws Exception {
		return categoryDAO.addCcategory(category);
	}

	public int addCscategory(Map<String, Object> map) throws Exception {
		return categoryDAO.addCscategory(map);
	}

	public int getCsCategoryCount(String category) throws Exception {
		return categoryDAO.getCsCategoryCount(category);
	}

	public boolean deleteCcategory(int c_idx) throws Exception {
		return categoryDAO.deleteCcategory(c_idx);
	}

	public boolean updateCcategory(Map<String, String> map) throws Exception {
		return categoryDAO.updateCcategory(map);
	}

	public boolean deleteCscategory(int c_idx) throws Exception {
		return categoryDAO.deleteCscategory(c_idx);
	}

	public boolean updateCscategory(Map<String, String> map) throws Exception {
		return categoryDAO.updateCscategory(map);
	}
}
