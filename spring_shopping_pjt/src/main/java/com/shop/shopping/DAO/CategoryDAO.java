package com.shop.shopping.DAO;

import java.util.List;

import com.shop.shopping.VO.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> getC_Category() throws Exception;
	public List<CategoryVO> getCsCategoryList(int category) throws Exception;
}
