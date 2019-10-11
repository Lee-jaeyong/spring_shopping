package com.shop.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.CategoryService;

@Controller
public class ShoppingCategoryController {

	@Autowired
	CategoryService CategoryService;
	
	@RequestMapping(value = "/categoryList.do", method = RequestMethod.GET)
	public String userList() throws Exception {
		return "category/category";
	}

}
