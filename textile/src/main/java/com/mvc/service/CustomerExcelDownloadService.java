package com.mvc.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mvc.service.CustomerFillManager;
import com.mvc.service.CustomerLayouter;
import com.mvc.service.Writer;
import com.mvc.model.CustomerBean;

import org.springframework.stereotype.Service;


@Service("customerExcelDownloadService")
@Transactional
public class CustomerExcelDownloadService {
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
	 public void downloadXLS(HttpServletResponse response) throws ClassNotFoundException {
	  logger.debug("Downloading Excel report");
	   
	  // 1. Create new workbook
	  HSSFWorkbook workbook = new HSSFWorkbook();
	   
	  // 2. Create new worksheet
	  HSSFSheet worksheet = workbook.createSheet("Customer Details");
	   
	  // 3. Define starting indices for rows and columns
	  int startRowIndex = 0;
	  int startColIndex = 0;
	   
	  // 4. Build layout 
	  // Build title, date, and column headers
	  CustomerLayouter.buildReport(worksheet, startRowIndex, startColIndex);
	  
	  // 5. Fill report
	  CustomerFillManager.fillReport(worksheet, startRowIndex, startColIndex, getDatasource());
	   
	  // 6. Set the response properties
	  String fileName = "CustomerReport.xls";
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
		 private List<CustomerBean> getDatasource() {
		  // Retrieve session
		  Session session = sessionFactory.getCurrentSession();
		  // Create query for retrieving products
		  Query query = session.createQuery("FROM CustomerBean");
		  // Execute query
		  List<CustomerBean> result = query.list();
		   
		  // Return the datasource
		  return result;
		 }
		 


	}