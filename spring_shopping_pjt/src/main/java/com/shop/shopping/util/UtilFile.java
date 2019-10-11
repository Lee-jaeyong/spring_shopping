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

	public void fileUpload(MultipartFile uploadFile) {
		String path = context.getRealPath("/") + "\\resources\\image\\";
		System.out.println(path);
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			byte[] bytes = uploadFile.getBytes();
			out = new FileOutputStream(path + uploadFile.getOriginalFilename());
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
	}
}