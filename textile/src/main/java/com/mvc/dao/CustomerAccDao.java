package com.mvc.dao;


import java.util.List;
import org.hibernate.exception.SQLGrammarException;

import com.mvc.model.CustomerAccount;
import com.mvc.model.CustomerBean;

public interface CustomerAccDao {

	void saveCustomerAcc(CustomerAccount customerAcc);
	
	List<CustomerAccount> findByCustomerId(int id);
	
	List<CustomerAccount> findAllCustomerAcc();
	
	CustomerAccount findById(int id);
	
	Double findCreditTotal();
	
	void deleteCustomerAcc(int id);
	
	void updateCusAcc(CustomerAccount customerAcc);
	
}
