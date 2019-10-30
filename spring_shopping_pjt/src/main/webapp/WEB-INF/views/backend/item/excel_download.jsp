<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.fasterxml.jackson.core.JsonParser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String nowDate = date.format(cal.getTime());
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename=shopping_" + nowDate + ".xls");
%>
<%@page
	import="org.apache.poi.hssf.usermodel.HSSFSheet,
     org.apache.poi.hssf.usermodel.HSSFWorkbook, 
     org.apache.poi.hssf.usermodel.*,
     java.io.FileOutputStream,java.util.*,
    java.io.*,
    org.apache.poi.hssf.usermodel.*
     "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>엑셀 POI 테스트</title>
</head>
<body>
	<%
		List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) request.getAttribute("list");

		HSSFWorkbook workbook = new HSSFWorkbook();

		//Sheet명 설정
		HSSFSheet sheet = workbook.createSheet("상품목록");
		HSSFRow row;
		HSSFCell cell;
		row = sheet.createRow(0);
		row.createCell(0).setCellValue("상품 번호");
		row.createCell(1).setCellValue("상품");
		row.createCell(2).setCellValue("대분류");
		row.createCell(3).setCellValue("소분류");
		row.createCell(4).setCellValue("가격");
		row.createCell(5).setCellValue("대표이미지");
		row.createCell(6).setCellValue("상품 등록일");

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(list.get(i).get("i_idx").toString());
			row.createCell(1).setCellValue(list.get(i).get("i_name").toString());
			row.createCell(2).setCellValue(list.get(i).get("c_categoryName").toString());
			row.createCell(3).setCellValue(list.get(i).get("cs_categoryName").toString());
			row.createCell(4).setCellValue(list.get(i).get("i_price").toString());
			row.createCell(5).setCellValue(list.get(i).get("img_path").toString());
			row.createCell(6).setCellValue(list.get(i).get("i_date").toString());
		}
		out.clear();
		out = pageContext.pushBody();
		OutputStream xlsOut = response.getOutputStream();
		workbook.write(xlsOut);
		xlsOut.close();
	%>
</body>
</html>