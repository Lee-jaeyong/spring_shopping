package com.shop.shopping.ajax.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.shopping.DAO.OrderDAO;
import com.shop.shopping.VO.OrderVO;

@Controller
public class ShoppingAjaxOrderController {

	@Autowired
	OrderDAO orderDAO;

	@RequestMapping(value = "/getOrderList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getOrderList(@RequestParam("search") String search,
			@RequestParam("sortType") String sortType, @RequestParam("page") String page,
			@RequestParam("showType") String showType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", "%" + search + "%");
		map.put("sortType", sortType);
		map.put("page", Integer.parseInt(page) * Integer.parseInt(showType));
		map.put("showType", Integer.parseInt(showType));
		List<OrderVO> list = orderDAO.getOrderList(map);
		int totalCount = orderDAO.getOrderCount("%" + search + "%");
		int startBlock = Integer.parseInt(page) / 10 * 10;
		int endBlock = startBlock + 10;
		int totalBlockCount = (int) (Math.ceil(totalCount / (Integer.parseInt(showType) * 1.0)));
		if (endBlock > totalBlockCount)
			endBlock = totalBlockCount;
		map = new HashMap<String, Object>();
		map.put("result", list);
		map.put("startBlock", startBlock);
		map.put("endBlock", endBlock);
		map.put("totalBlock", totalBlockCount);
		return new ObjectMapper().writeValueAsString(map);
	}
}
