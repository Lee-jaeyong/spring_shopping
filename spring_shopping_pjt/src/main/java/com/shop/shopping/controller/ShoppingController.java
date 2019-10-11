package com.shop.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	ShoppingService shoppingService;

	@RequestMapping(value = "/itemList.do", method = RequestMethod.GET)
	public String itemList() throws Exception {
		return "item/itemList";
	}

	@RequestMapping(value = "/addItem.do", method = RequestMethod.GET)
	public String addItem() throws Exception {
		return "item/addItem";
	}
}
