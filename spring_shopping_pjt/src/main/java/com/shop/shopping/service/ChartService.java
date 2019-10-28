package com.shop.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.shopping.DAO.ChartDAO;
import com.shop.shopping.VO.ChartVO;

@Service
public class ChartService {
	@Autowired
	ChartDAO chartDAO;
	
	public List<ChartVO> getNowDayChart() throws Exception {
		return chartDAO.getNowDayChart();
	}

}
