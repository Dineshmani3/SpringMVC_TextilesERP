package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.model.CustomerAccount;
import com.mvc.model.Inventory;
import com.mvc.model.Invoice;

@Repository("invoiceDao")
@Transactional
public class InvoiceDaoImpl extends AbstractDao<Integer, Invoice> implements InvoiceDao {

	public void saveInvoice(Invoice inv){
		persist(inv);
	}
	
	
	@SuppressWarnings("unchecked")
	public Invoice findInvoiceNo() {
		Criteria criteria = createEntityCriteria().addOrder(Order.desc("bill_no"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		criteria.setMaxResults(1);
		Invoice invoice = (Invoice) criteria.uniqueResult();
		return invoice;
	}
	
	@SuppressWarnings("unchecked")
	public List<Invoice> findAllByCusId(int linkId) {

		//SELECT * FROM `quotation_details` GROUP BY(reference)	
		
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("linkId", linkId));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		//criteria.setResultTransformer( Criteria.ALIAS_TO_ENTITY_MAP );
		List<Invoice> invc = (List<Invoice>) criteria.list();
		//System.out.println(invc);
		return invc;
	}
	
	public Invoice findById(Integer serial_no) {
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("bill_no", serial_no));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		Invoice invoice = (Invoice) criteria.uniqueResult();
		return invoice;
	}
	
	@SuppressWarnings("unchecked")
	public void findInvoiceBtwnDate(Date date1,Date date2) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.between("date", date1,date2));
		List<Invoice> invoice = (List<Invoice>) criteria.list();
		for(Invoice in:invoice){
			System.out.println(in);
		}
		
	}

	@SuppressWarnings("unchecked")
	
	public List<Invoice> findAllByDate(Date date) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("date", date));
		return (List<Invoice>)crit.list();
	}

	
	public long findBillCount() {
		Criteria criteria = createEntityCriteria(); 
		long millis=System.currentTimeMillis();
		Date date = new Date(millis);
		criteria.add(Restrictions.eq("date",  date));
		criteria.setProjection(Projections.rowCount());
		//long count = (long)criteria.uniqueResult();
		return (long) 0.0;
	}
	
	
	public Double findBillTotal() {
		Criteria criteria = createEntityCriteria(); 
		long millis=System.currentTimeMillis();
		Date date = new Date(millis);
		criteria.add(Restrictions.eq("date",  date));
		criteria.setProjection(Projections.sum("bill_amount"));
		Double count = (Double)criteria.uniqueResult();
		return count;
	}


	
	public void deleteInvoice(int id) {
			Criteria crit = createEntityCriteria();
			crit.add(Restrictions.eq("bill_no", id));
			Invoice invoice = (Invoice)crit.uniqueResult();
			delete(invoice);
		
	}
	
	
}
