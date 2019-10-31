package com.shop.shopping.ajax.backend.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.shopping.service.CategoryService;

@Controller
@RequestMapping(value = "/category")
public class ShoppingAjaxCategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/getCsCategoryList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getCsCategoryList(@RequestParam("c_category") String c_category) throws Exception {
		return new ObjectMapper().writeValueAsString(categoryService.getCsCategoryList(Integer.parseInt(c_category)));
	}

	@RequestMapping(value = "/getCcategoryList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getCCategoryList() throws Exception {
		return new ObjectMapper().writeValueAsString(categoryService.getC_Category());
	}

	@RequestMapping(value = "/addCcategory", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String addCcategory(@RequestParam("category") String category) throws Exception {
		try {
			categoryService.addCcategory(category);
		} catch (Exception e) {
			return "{\"result\":\"false\"}";
		}
		return "{\"result\":\"true\"}";
	}

	@RequestMapping(value = "/addCscategory", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String addCscategory(@RequestParam("category") String category,
			@RequestParam("categoryClass") String categoryClass) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("categoryClass", categoryClass);
		try {
			categoryService.addCscategory(map);
		} catch (Exception e) {
			return "{\"result\":\"false\"}";
		}
		return "{\"result\":\"true\"}";
	}

	@RequestMapping(value = "/deleteCcategory")
	public @ResponseBody String deleteCcategory(@RequestParam("c_idx") String c_idx) {
		try {
			categoryService.deleteCcategory(Integer.parseInt(c_idx));
			return "{\"result\":\"true\"}";
		} catch (Exception e) {
			return "{\"result\":\"false\"}";
		}
	}

	@RequestMapping(value = "/updateCcategory")
	public @ResponseBody String updateCcategory(@RequestParam("c_idx") String c_idx,
			@RequestParam("c_name") String c_name) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("c_idx", c_idx);
			map.put("c_name", c_name);
			categoryService.updateCcategory(map);
			return "{\"result\":\"true\"}";
		} catch (Exception e) {
			return "{\"result\":\"false\"}";
		}
	}
}
