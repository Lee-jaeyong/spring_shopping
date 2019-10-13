package com.shop.shopping.DAO;

import java.util.List;
import java.util.Map;

import com.shop.shopping.VO.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> getC_Category() throws Exception;

	public List<CategoryVO> getCsCategoryList(int category) throws Exception;

	public int addCcategory(String category) throws Exception;

	public int addCscategory(Map<String, Object> map) throws Exception;

	public int getCsCategoryCount(String category) throws Exception;
}
