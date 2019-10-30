package com.shop.shopping.ajax.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.shopping.DAO.ChartDAO;

@Controller
@RequestMapping(value="/chart")
public class ShoppingAjaxChartController {

	@Autowired
	ChartDAO chartDAO;

	@RequestMapping(value = "/getChartTime", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getNowDayChart() throws Exception {
		return new ObjectMapper().writeValueAsString(chartDAO.getNowDayChart());
	}
}
