package com.helper;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelBuilder extends AbstractExcelView {

	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse respond) throws Exception {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		ArrayList<String> listOfLists = (ArrayList<String>) model.get("listOfInfo");
		
		HSSFSheet sheet = workbook.createSheet("Revenue Report");

		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("Bolümü");
		header.createCell(1).setCellValue("Müdürü");
		header.createCell(2).setCellValue("Seyehat Eden");
		header.createCell(3).setCellValue("Seyehat Başlangıcı");
		header.createCell(4).setCellValue("Seyehat Sonu");
		header.createCell(5).setCellValue("Seyehat Yeri");
		header.createCell(6).setCellValue("Gidiş Amacı");
		header.createCell(7).setCellValue("Seyehat Miktarı");
		header.createCell(8).setCellValue("Proje Kodu");
		
		System.out.println(listOfLists.size());
		int rowNum = 1;
		for (int i = 0; i < listOfLists.size() / 9 ; i++) {
			//create the row data
			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(listOfLists.get((i*9) + 0));
			row.createCell(1).setCellValue(listOfLists.get((i*9) + 1));
			row.createCell(2).setCellValue(listOfLists.get((i*9) + 2));
			row.createCell(3).setCellValue(listOfLists.get((i*9) + 3));
			row.createCell(4).setCellValue(listOfLists.get((i*9) + 4));
			row.createCell(5).setCellValue(listOfLists.get((i*9) + 5));
			row.createCell(6).setCellValue(listOfLists.get((i*9) + 6));
			row.createCell(7).setCellValue(listOfLists.get((i*9) + 7));
			row.createCell(8).setCellValue(listOfLists.get((i*9) + 8));
           }
		
	}
	
}
