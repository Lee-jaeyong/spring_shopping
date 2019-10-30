package com.shop.shopping.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.CategoryService;

@Controller
@RequestMapping(value="/admin")
public class ShoppingCategoryController {

	@Autowired
	CategoryService CategoryService;
	
	@RequestMapping(value = "/categoryList.do", method = RequestMethod.GET)
	public String userList() throws Exception {
		return "backend/category/category";
	}

}
