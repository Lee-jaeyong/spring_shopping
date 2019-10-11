package com.shop.shopping.service;

import java.util.List;

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
}
