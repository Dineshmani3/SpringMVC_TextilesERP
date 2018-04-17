package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mvc.model.CustomerBean;


@Repository("customerMasterDao")
@Transactional


public class CustomerMasterDaoImpl extends AbstractDao<Integer, CustomerBean> implements CustomerMasterDao {
	//static final Logger logger = LoggerFactory.getLogger(CustomerMasterDaoImpl.class);
	
	 @Resource(name="sessionFactory")
	 private SessionFactory sessionFactory;
	
	
	 @Override
	public void saveCustomer(CustomerBean customerBean){
		persist(customerBean);
	}
	
	
	public CustomerBean findByCustomerId(int id) {
		CustomerBean customerMasterForm = getByKey(id);
		if(customerMasterForm!=null)
			Hibernate.initialize(customerMasterForm.getCusId());
		return customerMasterForm;
	}
	
	public CustomerBean findById(int id) {
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("cusId", id));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		CustomerBean CustomerMasterForm = (CustomerBean) criteria.uniqueResult();
		return CustomerMasterForm;
	}



	@SuppressWarnings("unchecked")
	public List<CustomerBean> findAllCustomer() {
		
		//logger.debug("Hello this is a debug message");
		//logger.info("Hello this is an info message");
		
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("cus_name"));
		//criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<CustomerBean> customerMasterForm = (List<CustomerBean>) criteria.list();
		return customerMasterForm;
	}
	

	@Override	
	public void deleteCustomer(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("cusId", id));
		CustomerBean customerMasterForm = (CustomerBean)crit.uniqueResult();
		delete(customerMasterForm);
	}	

	

	public void updateCustomer(CustomerBean customerMasterForm) {
		CustomerBean entity =findByCustomerId(customerMasterForm.getCusId());
		if(entity!=null){
			entity.setCusId(customerMasterForm.getCusId());
			entity.setCus_name(customerMasterForm.getCus_name());
			entity.setContact_no(customerMasterForm.getContact_no());
			entity.setAddress(customerMasterForm.getAddress());
			entity.setBalance(customerMasterForm.getBalance());
		}
	}


	@SuppressWarnings("unchecked")
	//@Override
	public List<CustomerBean> findByCustomerName(String cusname) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.like("cus_name", cusname, MatchMode.ANYWHERE));
		List<CustomerBean> customerBean = (List<CustomerBean>) criteria.list();
		return customerBean;
	}	
	

	@Override
	public void updateBalance(Double bal, int id) {
		CustomerBean entity =findByCustomerId(id);
		if(entity!=null){
			entity.setBalance(bal);
		}
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<CustomerBean> listPaginatedProductsUsingCriteria(int firstResult, int maxResults) {
        int paginatedCount = 0;
        System.out.println("firstResult - "+ firstResult+" - maxResults - "+maxResults);
        List<CustomerBean> products = null;
        try {
            Criteria criteria = createEntityCriteria().addOrder(Order.asc("cusId"));
            criteria.setFirstResult(firstResult);
            criteria.setMaxResults(maxResults);
            products = (List<CustomerBean>) criteria.list();
            
            if (products != null) {
                paginatedCount = products.size();
                System.out.println("Total Results: " + paginatedCount);
                for (CustomerBean product : products) {
                    System.out.println("Retrieved Product using Criteria. Name: " + product.getAddress());
                }
            }
 
        } catch (HibernateException e){
            e.printStackTrace();
        }
        return products;
    }


	@Override
	public Double findBalByCusId(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("cusId", id));
		crit.setProjection(Projections.property("balance"));
		Double bal = (Double)crit.uniqueResult();
		return bal;
	}


}
