package com.shop.shopping.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUpload {
	public static String ExcelParseJson(String path) {

		try {
			FileInputStream fis = new FileInputStream(path);
			XSSFRow row;
			StringBuilder json = new StringBuilder();
			json.append("{\"result\":[");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			int sheetCn = workbook.getNumberOfSheets();
			for (int cn = 0; cn < sheetCn; cn++) {
				XSSFSheet sheet = workbook.getSheetAt(cn);
				int rows = sheet.getPhysicalNumberOfRows();
				for (int r = 1; r < rows; r++) {
					row = sheet.getRow(r);
					if (row != null) {
						String i_name = row.getCell(0).getStringCellValue();
						int c_category = (int) row.getCell(1).getNumericCellValue();
						int cs_category = (int) row.getCell(2).getNumericCellValue();
						int i_price = (int) row.getCell(3).getNumericCellValue();
						String i_main = row.getCell(4).getStringCellValue();
						String i_detail = row.getCell(5).getStringCellValue();
						String i_info = row.getCell(6).getStringCellValue();
						json.append("{\"i_name\":\"" + i_name + "\",\"c_category\":\"" + c_category
								+ "\",\"cs_category\":\"" + cs_category + "\",\"i_price\":\"" + i_price
								+ "\",\"i_main\":\"" + i_main + "\",\"i_detail\":\"" + i_detail + "\",\"i_info\":\""
								+ i_info + "\"}");
						if (r != rows - 1)
							json.append(",");
					}
				}
			}
			json.append("]}");
			return json.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{\"result\":\"false\"}";
	}

	public static ArrayList<Map<String, Object>> excelUpload(String path) throws IOException {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		FileInputStream fis = new FileInputStream(path);
		XSSFRow row;
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			int sheetCn = workbook.getNumberOfSheets();
			for (int cn = 0; cn < sheetCn; cn++) {
				XSSFSheet sheet = workbook.getSheetAt(cn);
				int rows = sheet.getPhysicalNumberOfRows();
				for (int r = 1; r < rows; r++) {
					row = sheet.getRow(r);
					if (row != null) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("i_name", StringFilter.cleanXSS(row.getCell(0).getStringCellValue()));
						map.put("i_price", (int) row.getCell(3).getNumericCellValue());
						map.put("i_deteil", row.getCell(5).getStringCellValue());
						map.put("i_info", StringFilter.cleanXSS(row.getCell(6).getStringCellValue()));
						map.put("c_idx", (int) row.getCell(1).getNumericCellValue());
						map.put("i_main", row.getCell(4).getStringCellValue());
						map.put("cs_idx", (int) row.getCell(2).getNumericCellValue());
						list.add(map);
					}
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
