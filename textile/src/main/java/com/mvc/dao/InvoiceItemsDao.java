package com.mvc.dao;

import java.util.List;

import com.mvc.model.InvoiceItems;

public interface InvoiceItemsDao {

	void saveInvoiceGoods(InvoiceItems ig); 
	
	List<InvoiceItems> findByAllId(Integer serial_no);
	
}
