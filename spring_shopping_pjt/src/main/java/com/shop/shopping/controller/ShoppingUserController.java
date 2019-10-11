package com.shop.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.shopping.service.UserService;

@Controller
public class ShoppingUserController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/userList.do", method = RequestMethod.GET)
	public String userList() throws Exception {
		return "user/userList";
	}

}
