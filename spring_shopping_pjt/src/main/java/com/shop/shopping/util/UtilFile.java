package com.shop.shopping.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class UtilFile {

	@Autowired
	ServletContext context;

	public String fileUpload(boolean check, MultipartFile uploadFile) {
		String chk = "mainImg";
		if (check == true)
			chk = "detailImg";
		String path = context.getRealPath("/") + "\\src\\main\\webapp\\resources\\image\\front\\images\\" + chk + "\\";
		path = path.replace("wtpwebapps", "webapps").replace("\\spring_shopping_pjt\\",
				"\\spring_shopping\\spring_shopping_pjt\\");
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			byte[] bytes = uploadFile.getBytes();
			out = new FileOutputStream(path + uploadFile.getOriginalFilename().replace("jpg", "jpeg"));
			out.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path + uploadFile.getOriginalFilename();
	}
}