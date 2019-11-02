package com.shop.shopping.front.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shop.shopping.service.ShoppingService;

@Controller
public class ShoppingFrontController {
	@Autowired
	ShoppingService shoppingService;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() throws Exception {
		return "front/index";
	}

	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
	public ModelAndView shop(HttpServletRequest request) throws Exception {
		int page = 0;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		String sortType = "i_idx";
		if (!request.getParameter("sortType").equals(""))
			sortType = request.getParameter("sortType");
		String search = "";
		if (!request.getParameter("search").equals(""))
			search = request.getParameter("search");
		ModelAndView mav = new ModelAndView();
		int totalCount = shoppingService.getTotalListCount("%" + search + "%");
		int startBlock = page / 6 * 10;
		int endBlock = startBlock + 10;
		int totalBlockCount = (int) (Math.ceil(totalCount / 6.0));
		if (endBlock > totalBlockCount)
			endBlock = totalBlockCount;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", "%" + search + "%");
		map.put("sortType", sortType);
		map.put("page", page * 6);
		map.put("showType", 6);
		mav.setViewName("front/shop");
		mav.addObject("itemList", shoppingService.getItemlist(map));
		mav.addObject("startBlock", startBlock);
		mav.addObject("endBlock", endBlock);
		mav.addObject("totalBlockCount", totalBlockCount);
		mav.addObject("page", page);
		return mav;
	}
}
