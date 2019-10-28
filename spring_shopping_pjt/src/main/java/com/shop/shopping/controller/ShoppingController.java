package com.shop.shopping.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.shopping.VO.ItemVO;
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
	public String addItemExecute(ItemVO itemVO, @RequestParam("ImgMain") MultipartFile ImgMain,
			@RequestParam("ImgDetail") MultipartFile ImgDetail) throws Exception {
		String mainImg = utilFile.fileUpload(false, ImgMain);
		String detailImg = utilFile.fileUpload(true, ImgDetail);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("i_name", itemVO.getI_name());
		map.put("i_price", itemVO.getI_price());
		map.put("i_deteil", detailImg.substring(detailImg.indexOf("front")));
		map.put("i_info", itemVO.getI_info());
		map.put("c_idx", itemVO.getC_categoryNum());
		map.put("i_main", mainImg.substring(mainImg.indexOf("front")));
		map.put("cs_idx", itemVO.getCs_categoryNum());
		shoppingService.addItem(map);
		return "redirect:itemList.do";
	}
	
	@RequestMapping(value ="/addAllItem.do", method = RequestMethod.GET)
	public String addAllItem() {
		return "item/addAllItem";
	}
}
