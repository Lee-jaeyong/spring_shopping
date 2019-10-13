package com.shop.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.OrderService;

@Controller
public class ShoppingOrderController {

	@Autowired
	OrderService orderService;

	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public String userList() throws Exception {
		return "order/orderList";
	}

}
