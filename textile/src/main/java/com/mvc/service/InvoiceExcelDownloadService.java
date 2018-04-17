package com.mvc.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mvc.model.Invoice;
import com.mvc.service.CustomerFillManager;
import com.mvc.service.CustomerLayouter;
import com.mvc.service.Writer;

import org.springframework.stereotype.Service;


@Service("invoiceExcelDownloadService")
@Transactional
public class InvoiceExcelDownloadService {
	 static Logger logger = Logger.getLogger("service");
	 
	 
	 @Resource(name="sessionFactory")
	 private SessionFactory sessionFactory;
	  
	 /**
	  * Processes the download for Excel format.
	  * It does the following steps:
	  * <pre>1. Create new workbook
	  * 2. Create new worksheet
	  * 3. Define starting indices for rows and columns
	  * 4. Build layout 
	  * 5. Fill report
	  * 6. Set the HttpServletResponse properties
	  * 7. Write to the output stream
	  * </pre>
	  */
	 @SuppressWarnings("unchecked")
	 public void downloadXLS(HttpServletResponse response,Date date1, Date date2) throws ClassNotFoundException {
	  logger.debug("Downloading Excel report");
	   
	  // 1. Create new workbook
	  HSSFWorkbook workbook = new HSSFWorkbook();
	   
	  // 2. Create new worksheet
	  HSSFSheet worksheet = workbook.createSheet("Invoice Details");
	   
	  // 3. Define starting indices for rows and columns
	  int startRowIndex = 0;
	  int startColIndex = 0;
	   
	  // 4. Build layout 
	  // Build title, date, and column headers
	  InvoiceLayouter.buildReport(worksheet, startRowIndex, startColIndex,date1,date2);
	 
	  // 5. Fill report
	  InvoiceFillManager.fillReport(worksheet, startRowIndex, startColIndex, getDatasource(date1,date2));
	   
	  // 6. Set the response properties
	  String fileName = "Invoice.xls";
	  response.setHeader("Content-Disposition", "inline; filename=" + fileName);
	  // Make sure to set the correct content type
	  response.setContentType("application/vnd.ms-excel");
	   
	  //7. Write to the output stream
	  Writer.write(response, worksheet);
	 }
	  
	 /**
	  * Retrieves the datasource as as simple Java List.
	  * The datasource is retrieved from a Hibernate HQL query.
	  */
	 @SuppressWarnings("unchecked")
	 private List<Invoice> getDatasource(Date date1, Date date2) {
	  // Retrieve session
	  Session session = sessionFactory.getCurrentSession();
	  System.out.println(date1+" "+date2);
	  // Create query for retrieving products
	  String q="FROM Invoice WHERE date BETWEEN '"+date1+"' AND '"+date2+"'";
	  Query query = session.createQuery(q);
	  // Execute query
	  List<Invoice> result = query.list();
	   for(Invoice in:result){
		   System.out.println("Invoice "+in.getDate());
	   }
	  // Return the datasource
	  return result;
	 }
	}