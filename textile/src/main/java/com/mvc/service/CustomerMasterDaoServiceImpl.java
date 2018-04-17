package com.mvc.service;

import java.util.List;

import org.hibernate.exception.SQLGrammarException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.CustomerMasterDao;
import com.mvc.model.CustomerBean;

@Service("customerMasterDaoService")
@Transactional
public class CustomerMasterDaoServiceImpl implements CustomerMasterDaoService {
	@Autowired
	CustomerMasterDao dao;
	
	static final Logger logger = LoggerFactory.getLogger(CustomerMasterDaoServiceImpl.class);
	
	public void saveCustomer(CustomerBean customerBean) {
		dao.saveCustomer(customerBean);
	}

	public CustomerBean findByCustomerId(int id) {
		CustomerBean customerMasterForm=dao.findByCustomerId(id);
		return customerMasterForm;
	}

	public List<CustomerBean> findAllCustomer() {
		logger.info("I am in CustomerMasterDaoServiceImpl - findAllCustomer ");
		return dao.findAllCustomer();
	}
	
	public CustomerBean findById(int id) {
		CustomerBean customerMasterForm=dao.findById(id);
		return customerMasterForm;
	}

	public void deleteCustomer(int id) {
		dao.deleteCustomer(id);
	}

	public void updateCustomer(CustomerBean customerMasterForm) {
		dao.updateCustomer(customerMasterForm);
	}

	

	
}
