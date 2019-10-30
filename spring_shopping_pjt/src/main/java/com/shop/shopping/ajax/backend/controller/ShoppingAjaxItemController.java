package com.shop.shopping.ajax.backend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.shopping.VO.ItemVO;
import com.shop.shopping.service.ShoppingService;
import com.shop.shopping.util.ExcelUpload;

@Controller
@RequestMapping(value = "/item")
public class ShoppingAjaxItemController {

	@Autowired
	ShoppingService shoppingService;

	@RequestMapping(value = "/getItemList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getItemList(@RequestParam("search") String search,
			@RequestParam("sortType") String sortType, @RequestParam("page") String page,
			@RequestParam("showType") String showType) throws Exception {
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

	@RequestMapping(value = "/deleteItem", method = RequestMethod.GET)
	public @ResponseBody String deleteItem(@RequestParam("i_idx") String i_idx) {
		try {
			shoppingService.deleteItem(Integer.parseInt(i_idx));
			shoppingService.deleteColorAndSize(Integer.parseInt(i_idx));
			shoppingService.deleteStock(Integer.parseInt(i_idx));
			return "{\"result\":\"true\"}";
		} catch (Exception e) {
			return "{\"result\":\"false\"}";
		}
	}

	@RequestMapping(value = "/excelList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getExcelList(@RequestParam("path") String path) {
		String json = ExcelUpload.ExcelParseJson(path);
		return json;
	}

	@RequestMapping(value = "/excelUpload", method = RequestMethod.GET)
	public @ResponseBody String excelUpload(@RequestParam("path") String path) throws IOException {
		ArrayList<Map<String, Object>> list = ExcelUpload.excelUpload(path);
		try {
			for (int i = 0; i < list.size(); i++) {
				shoppingService.addItem(list.get(i));
			}
			return "{\"result\":\"true\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"result\":\"false\"}";
		}
	}

	@RequestMapping(value = "/excelDown", method = RequestMethod.GET)
	public ModelAndView excelDown(HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("backend/item/excel_download");
		List<HashMap<String, Object>> list = shoppingService.getItemlistAll();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/stockItem", method = RequestMethod.POST)
	public @ResponseBody String stockItem(@RequestParam("i_idx") String i_idx) throws Exception {
		return new ObjectMapper().writeValueAsString(shoppingService.stockItem(Integer.parseInt(i_idx)));
	}

	@RequestMapping(value = "/stockUpdate", method = RequestMethod.POST)
	public @ResponseBody String stockUpdate(@RequestParam("data") String data) {
		StringTokenizer stringTokenizer = new StringTokenizer(data, "/");
		while (stringTokenizer.hasMoreTokens()) {
			String tokenData = stringTokenizer.nextToken();
			String[] tokenDataSplit = tokenData.split(",");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("stockId", tokenDataSplit[0]);
			map.put("input", tokenDataSplit[1]);
			try {
				shoppingService.updateStock(map);
			} catch (Exception e) {
				return "{\"result\":\"false\"}";
			}
		}
		return "{\"result\":\"true\"}";
	}
}
