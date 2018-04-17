package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import com.mvc.model.Inventory;
import com.mvc.model.Invoice;

public interface InvoiceDao {

	void saveInvoice(Invoice inv);
	
	Invoice findInvoiceNo();
	
	List<Invoice> findAllByCusId(int linkId);
	
	Invoice findById(Integer serial_no);
	
	long findBillCount();
	
	Double findBillTotal();
	
	void findInvoiceBtwnDate(Date date1, Date date2);
	
	List<Invoice> findAllByDate(Date date);
	
	void deleteInvoice(int id);
}
