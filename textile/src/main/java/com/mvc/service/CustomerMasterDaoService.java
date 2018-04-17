package com.mvc.service;

import java.util.List;

import com.mvc.model.CustomerBean;

public interface CustomerMasterDaoService {

	void saveCustomer(CustomerBean customerBean);
	
	CustomerBean findByCustomerId(int id);
	
	List<CustomerBean> findAllCustomer();
	
	CustomerBean findById(int id);
	
	void deleteCustomer(int id);
	
	void updateCustomer(CustomerBean customerBean);
	
	
	
	
	
}
