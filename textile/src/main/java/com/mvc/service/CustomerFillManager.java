package com.mvc.service;

 
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.model.CustomerBean;

 
public class CustomerFillManager {
	
	@Autowired
	static CustomerMasterDaoService cusDao;
 
 /**
  * Fills the report with content
  * 
  * @param worksheet
  * @param startRowIndex starting row offset
  * @param startColIndex starting column offset
  * @param datasource the data source
  */
 public static void fillReport(HSSFSheet worksheet, int startRowIndex, int startColIndex, List<CustomerBean> datasource) {
  // Row offset
  startRowIndex += 2;
   
  // Create cell style for the body
  HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();
  bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
  bodyCellStyle.setWrapText(true);
   
  // Create body
  for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {
   // Create a new row
   HSSFRow row = worksheet.createRow((short) i+1);
 
   HSSFCell cell1 = row.createCell(startColIndex+0);
   cell1.setCellValue(datasource.get(i-2).getCusId());
   cell1.setCellStyle(bodyCellStyle);
 
   HSSFCell cell2 = row.createCell(startColIndex+1);
   cell2.setCellValue(datasource.get(i-2).getCus_name());
   cell2.setCellStyle(bodyCellStyle);
 
   
   HSSFCell cell3 = row.createCell(startColIndex+5);
   cell3.setCellValue(datasource.get(i-2).getContact_no());
   cell3.setCellStyle(bodyCellStyle);
   
   //Address
   HSSFCell cell4 = row.createCell(startColIndex+3);
   cell4.setCellValue(datasource.get(i-2).getAddress());
   cell4.setCellStyle(bodyCellStyle);
  
   
   HSSFCell cell5 = row.createCell(startColIndex+7);
   cell5.setCellValue(datasource.get(i-2).getBalance().toString());
   cell5.setCellStyle(bodyCellStyle);
   
   
  
  }
 }
 
 
 
}