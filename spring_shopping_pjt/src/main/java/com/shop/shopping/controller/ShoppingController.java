package com.shop.shopping.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.shopping.service.CategoryService;
import com.shop.shopping.service.ShoppingService;
import com.shop.shopping.util.UtilFile;

@Controller
public class ShoppingController {

	@Autowired
	ShoppingService shoppingService;

	@Autowired
	CategoryService categoryService;

	@Inject
	UtilFile utilFile;

	@RequestMapping(value = "/itemList.do", method = RequestMethod.GET)
	public String itemList() throws Exception {
		return "item/itemList";
	}

	@RequestMapping(value = "/addItem.do", method = RequestMethod.GET)
	public ModelAndView addItem() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("item/addItem");
		mav.addObject("categoryList", categoryService.getC_Category());
		return mav;
	}

	@RequestMapping(value = "/addItemExecute.do", method = RequestMethod.POST)
	public String addItemExecute(@RequestParam("img_path") MultipartFile img_path) throws Exception {
		utilFile.fileUpload(img_path);
		return "redirect:itemList.do";
	}
}
