package com.shop.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.ShoppingService;

@Controller
public class ShoppingController {

	@Autowired
	ShoppingService shoppingService;

	@RequestMapping(value = "/itemList.do", method = RequestMethod.GET)
	public String itemList(Model model) throws Exception {
		return "item/itemList";
	}

}
