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
import com.shop.shopping.VO.ItemVO;
import com.shop.shopping.service.ShoppingService;

@Controller
public class ShoppingItemController {

	@Autowired
	ShoppingService shoppingService;

	@RequestMapping(value = "/getItemList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getItemList(@RequestParam("search") String search, @RequestParam("sortType") String sortType,
			@RequestParam("page") String page, @RequestParam("showType") String showType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", "%" + search + "%");
		map.put("sortType", sortType);
		map.put("page", Integer.parseInt(page) * Integer.parseInt(showType));
		map.put("showType", Integer.parseInt(showType));
		List<ItemVO> list = shoppingService.getItemlist(map);
		int totalCount = shoppingService.getTotalListCount("%" + search + "%");
		int startBlock = Integer.parseInt(page) / 10 * 10;
		int endBlock = startBlock + 10;
		int totalBlockCount = (int) (Math.ceil(totalCount / (Integer.parseInt(showType) * 1.0)));
		if (endBlock > totalBlockCount)
			endBlock = totalBlockCount;
		ObjectMapper json = new ObjectMapper();
		StringBuilder getJson = new StringBuilder("{\"result\":" + json.writeValueAsString(list));
		getJson.append(",\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlockCount + "\"}");
		return getJson.toString();
	}
}
