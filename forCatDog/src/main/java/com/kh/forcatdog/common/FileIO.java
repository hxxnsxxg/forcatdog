package com.kh.forcatdog.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileIO {
	public static String saveFile(MultipartFile file, HttpServletRequest request, String folderName) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\" + folderName;

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String changeFileName = sdf.format(new Date(System.currentTimeMillis())) + (int)(Math.random() * 1000000) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String changePath = folder + "\\" + changeFileName;

		try {
			file.transferTo(new File(changePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeFileName;
	}

	public static void moveFileToTemp(String fileName, HttpServletRequest request, String folderName) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\" + folderName + "\\" + fileName;
		String tempPath = root + "\\temp\\" + folderName;

		File tempFolder = new File(tempPath);
		if (!tempFolder.exists()) {
			tempFolder.mkdirs();
		}

		Path file = Paths.get(savePath);
		Path movePath = Paths.get(tempPath);

		try {
			Files.move(file, movePath.resolve(file.getFileName()));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
