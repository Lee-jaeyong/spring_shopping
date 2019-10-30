package com.shop.shopping.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingFrontController {

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() throws Exception {
		return "front/index";
	}

	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
	public String shop() throws Exception {
		return "front/shop";
	}
}
