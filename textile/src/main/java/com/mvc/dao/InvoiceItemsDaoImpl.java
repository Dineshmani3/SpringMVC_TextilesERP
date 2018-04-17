package com.mvc.dao;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.model.Invoice;
import com.mvc.model.InvoiceItems;

@Repository("invoiceItemsDao")
@Transactional
public class InvoiceItemsDaoImpl extends AbstractDao<Integer, InvoiceItems> implements InvoiceItemsDao {

	public void saveInvoiceGoods(InvoiceItems ig){
		persist(ig);
	}
	
	@SuppressWarnings("unchecked")
	public List<InvoiceItems> findByAllId(Integer serial_no) {
		Criteria criteria = createEntityCriteria(); 
		criteria.add(Restrictions.eq("bill_no", serial_no));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<InvoiceItems> invoiceg = (List<InvoiceItems>) criteria.list();
		return invoiceg;
	}
}
