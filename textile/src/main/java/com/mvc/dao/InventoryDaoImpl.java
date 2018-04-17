package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mvc.model.Inventory;


@Repository("inventoryDao")
public class InventoryDaoImpl extends AbstractDao<Integer, Inventory> implements InventoryDao {

	@SuppressWarnings("unchecked")
	public List<Inventory> findByAll(){
		Criteria crit = createEntityCriteria();
		return (List<Inventory>)crit.list();
	}
	
	public void saveInventory(Inventory inven){
		persist(inven);
	}
	
	public void deleteInventory(Integer item_id){
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("item_id", item_id));
		Inventory inven = (Inventory)crit.uniqueResult();
		delete(inven);
	}

	
	public Inventory findById(Integer item_id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("item_id", item_id));
		Inventory inven = (Inventory)crit.uniqueResult();
		return inven;
	}

	@SuppressWarnings("unchecked")
	
	public List<Inventory> findAllByName(String item_name) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.like("item_name", item_name, MatchMode.ANYWHERE));
		System.out.println((List<Inventory>)crit.list());
		return (List<Inventory>)crit.list();
	}

	
}
