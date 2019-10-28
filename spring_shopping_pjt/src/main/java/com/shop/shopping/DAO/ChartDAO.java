package com.shop.shopping.DAO;

import java.util.List;

import com.shop.shopping.VO.ChartVO;

public interface ChartDAO {
	public List<ChartVO> getNowDayChart() throws Exception;
}
