package com.mvc.service;

 
import java.text.DateFormat;
import java.util.List;
 



import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.mvc.model.Invoice;
 
public class InvoiceFillManager {
 
 /**
  * Fills the report with content
  * 
  * @param worksheet
  * @param startRowIndex starting row offset
  * @param startColIndex starting column offset
  * @param datasource the data source
  */
 public static void fillReport(HSSFSheet worksheet, int startRowIndex, int startColIndex, List<Invoice> datasource) {
  // Row offset
  startRowIndex += 2;
   
  Font font = worksheet.getWorkbook().createFont();
  font.setBoldweight(Font.BOLDWEIGHT_BOLD);
  // Create cell style for the body
  HSSFCellStyle headerCellStyle = worksheet.getWorkbook().createCellStyle();
  headerCellStyle.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
  headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
  headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
  headerCellStyle.setWrapText(true);
  headerCellStyle.setFont(font);
  headerCellStyle.setBorderTop(CellStyle.BORDER_THIN);
  headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN);
  
  HSSFCellStyle totalStyle = worksheet.getWorkbook().createCellStyle();
  totalStyle.setAlignment(CellStyle.ALIGN_RIGHT);
  totalStyle.setWrapText(true);
  totalStyle.setBorderTop(CellStyle.BORDER_THIN);
  totalStyle.setBorderBottom(CellStyle.BORDER_THIN);
  
  HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();
  bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
  bodyCellStyle.setWrapText(true);
  
  HSSFCellStyle amountStyle = worksheet.getWorkbook().createCellStyle();
  amountStyle.setAlignment(CellStyle.ALIGN_RIGHT);
  amountStyle.setWrapText(true);
  HSSFRow row = null;
  int j=0;
  // Create body
  for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {
   // Create a new row
   row = worksheet.createRow((short) i+1);
   j=i;
   java.sql.Date date = datasource.get(i-2).getDate();
   System.out.println(date);
   HSSFCell cell1 = row.createCell(startColIndex+0);
   cell1.setCellValue(datasource.get(i-2).getBill_no());
   cell1.setCellStyle(bodyCellStyle);
 
   HSSFCell cell2 = row.createCell(startColIndex+1);
   cell2.setCellValue(date.toString());
   cell2.setCellStyle(bodyCellStyle);
   
   HSSFCell cell3 = row.createCell(startColIndex+2);
   cell3.setCellValue(datasource.get(i-2).getBill_amount());
   cell3.setCellStyle(amountStyle);
   
   
  }
  Double sum=0.0;
  for(int i =0;i<datasource.size();i++){
	  sum+=datasource.get(i).getBill_amount();
  }
  HSSFRow row2 = worksheet.createRow((short) j+2);
  HSSFCell cellt = row2.createCell(startColIndex+1);
  cellt.setCellValue("Total");
  cellt.setCellStyle(headerCellStyle);
  HSSFCell celltot = row2.createCell(startColIndex+2);
  celltot.setCellValue(sum);
  celltot.setCellStyle(totalStyle);

  
  
 }
}