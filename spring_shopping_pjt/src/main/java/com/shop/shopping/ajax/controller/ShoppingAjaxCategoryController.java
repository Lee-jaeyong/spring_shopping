package com.shop.shopping.ajax.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.shopping.VO.CategoryVO;
import com.shop.shopping.service.CategoryService;

@Controller
public class ShoppingAjaxCategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/getCsCategoryList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getCsCategoryList(@RequestParam("c_category") String c_category) throws Exception {
		List<CategoryVO> list = categoryService.getCsCategoryList(Integer.parseInt(c_category));
		ObjectMapper json = new ObjectMapper();
		String getJson = json.writeValueAsString(list);
		return getJson;
	}
}
