package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mvc.model.CustomerAccount;



@Repository("customerAccDao")
@Transactional
public class CustomerAccDaoImpl extends AbstractDao<Integer, CustomerAccount> implements CustomerAccDao {
	static final Logger logger = LoggerFactory.getLogger(CustomerAccDaoImpl.class);
	
	 @Resource(name="sessionFactory")
	 private SessionFactory sessionFactory;
	


	@Override
	public void saveCustomerAcc(CustomerAccount customerAcc) {
		persist(customerAcc);
	}



	@SuppressWarnings("unchecked")
	public List<CustomerAccount> findAllCustomerAcc() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstname"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<CustomerAccount> customerAccForm = (List<CustomerAccount>) criteria.list();
		return customerAccForm;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<CustomerAccount> findByCustomerId(int id) {
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("cus_id", id));
		List<CustomerAccount> customerAccForm = (List<CustomerAccount>) criteria.list();
		return customerAccForm;
	}

	public CustomerAccount findById(int id) {
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("id", id));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		CustomerAccount customerAccForm = (CustomerAccount) criteria.uniqueResult();
		return customerAccForm;
	}

	@Override
	public Double findCreditTotal() {
		Criteria criteria = createEntityCriteria(); 
		long millis=System.currentTimeMillis();
		Date date = new Date(millis);
		criteria.add(Restrictions.eq("date",  date));
		criteria.setProjection(Projections.sum("credit"));
		Double count = (Double)criteria.uniqueResult();
		return count;
	}



	//@Override
	public void deleteCustomerAcc(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		CustomerAccount customerAccForm = (CustomerAccount)crit.uniqueResult();
		delete(customerAccForm);
		
	}



	//@Override
	public void updateCusAcc(CustomerAccount customerAcc) {
		CustomerAccount entity =findById(customerAcc.getId());
		Double bal;
		Double credit = entity.getCredit();
		if(customerAcc.getCredit()!=null) {
			
			if(credit==null) {
				credit = 0.0;
			}
			
		}
		bal = entity.getBalance()+(credit-customerAcc.getCredit());
		if(customerAcc.getDebit()!=null) {
			Double debit=entity.getDebit();
			if(debit==null) {
				debit = 0.0;
			}
			bal = bal - (debit-customerAcc.getDebit());
		}
		
		if(entity!=null){
			entity.setCus_id(customerAcc.getCus_id());
			entity.setBill_no(customerAcc.getBill_no());
			entity.setDate(customerAcc.getDate());
			entity.setDebit(customerAcc.getDebit());
			entity.setCredit(customerAcc.getCredit());
			entity.setBalance(bal);
		}
	}



}
