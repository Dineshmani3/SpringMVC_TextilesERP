package com.mvc.dao;

import java.util.List;
import org.hibernate.exception.SQLGrammarException;

import com.mvc.model.CustomerBean;

public interface CustomerMasterDao {

	void saveCustomer(CustomerBean customerBean);
	
	CustomerBean findByCustomerId(int id);
	
	List<CustomerBean> findAllCustomer();
	
	List<CustomerBean> findByCustomerName(String cusname);
	
	List<CustomerBean> listPaginatedProductsUsingCriteria(int firstResult, int maxResults) ;
	
	CustomerBean findById(int id);
	
	void deleteCustomer(int id);
	
	void updateCustomer(CustomerBean customerBean);
	
	void updateBalance(Double bal,int id);
	
	Double findBalByCusId(int id);
	
}
