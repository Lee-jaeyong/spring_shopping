package com.shop.shopping.itemAjax;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.shopping.VO.ItemVO;
import com.shop.shopping.service.ShoppingService;

import net.sf.json.JSONArray;

public class GetItemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	ShoppingService shoppingService;
	
	public GetItemListServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search", request.getParameter("search"));
			map.put("sortType", request.getParameter("sortType"));
			map.put("page", request.getParameter("page"));
			map.put("showType", request.getParameter("showType"));
			List<ItemVO> list = shoppingService.getItemlist(map);
			
			JSONArray json = new JSONArray();
			System.out.println(json.fromObject(list).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
