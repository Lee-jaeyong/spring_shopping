package com.shop.shopping.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

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
@RequestMapping(value = "/admin")
public class ShoppingItemController {

	@Autowired
	ShoppingService shoppingService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	UtilFile utilFile;

	@Autowired
	ServletContext context;

	@RequestMapping(value = "/itemList.do", method = RequestMethod.GET)
	public String itemList() throws Exception {
		return "backend/item/itemList";
	}

	@RequestMapping(value = "/addItem.do", method = RequestMethod.GET)
	public ModelAndView addItem() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("backend/item/addItem");
		mav.addObject("categoryList", categoryService.getC_Category());
		return mav;
	}

	@RequestMapping(value = "/addItemExecute.do", method = RequestMethod.POST)
	public String addItemExecute(ItemVO itemVO, @RequestParam("i_color") List<String> i_color,
			@RequestParam("i_size") List<String> i_size, @RequestParam("ImgMain") MultipartFile ImgMain,
			@RequestParam("ImgDetail") MultipartFile ImgDetail) throws Exception {
		String mainImg = utilFile.fileUpload(false, ImgMain);
		String detailImg = utilFile.fileUpload(true, ImgDetail);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("i_name", itemVO.getI_name());
		map.put("i_price", itemVO.getI_price());
		map.put("i_deteil", detailImg.substring(detailImg.indexOf("front")).replace("jpg", "jpeg"));
		map.put("i_info", itemVO.getI_info());
		map.put("c_idx", itemVO.getC_categoryNum());
		map.put("i_main", mainImg.substring(mainImg.indexOf("front")).replace("jpg", "jpeg"));
		map.put("cs_idx", itemVO.getCs_categoryNum());
		shoppingService.addItem(map);
		for (int i = 0; i < i_color.size(); i++) {
			for (int j = 0; j < i_size.size(); j++) {
				Map<String,String> sizeAndColor = new HashMap<String, String>();
				sizeAndColor.put("color", i_color.get(i));
				sizeAndColor.put("size", i_size.get(j));
				shoppingService.addColorAndSize(sizeAndColor);
				shoppingService.addStock();
			}
		}
		return "redirect:itemList.do";
	}

	@RequestMapping(value = "/addAllItem.do", method = RequestMethod.GET)
	public String addAllItem() {
		return "backend/item/addAllItem";
	}

	@RequestMapping(value = "/updateItem.do", method = RequestMethod.POST)
	public ModelAndView updateItem(@RequestParam("i_idx") String i_idx) throws NumberFormatException, Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("backend/item/addItem");
		mav.addObject("categoryList", categoryService.getC_Category());
		mav.addObject("itemVO", shoppingService.selectItem(Integer.parseInt(i_idx)));
		return mav;
	}

	@RequestMapping(value = "/updateItemExecute.do", method = RequestMethod.POST)
	public String updateItemExecute(ItemVO itemVO, @RequestParam("ImgMain") MultipartFile ImgMain,
			@RequestParam("ImgDetail") MultipartFile ImgDetail) throws Exception {
		String mainImg = utilFile.fileUpload(false, ImgMain);
		String detailImg = utilFile.fileUpload(true, ImgDetail);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("i_idx", itemVO.getI_idx());
		map.put("i_name", itemVO.getI_name());
		map.put("i_price", itemVO.getI_price());
		map.put("i_deteil", detailImg.substring(detailImg.indexOf("front")).replace("jpg", "jpeg"));
		map.put("i_info", itemVO.getI_info());
		map.put("i_main", mainImg.substring(mainImg.indexOf("front")).replace("jpg", "jpeg"));
		shoppingService.updateItem(map);
		return "redirect:itemList.do";
	}
}
