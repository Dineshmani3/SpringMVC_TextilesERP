package com.mvc.dao;

import java.sql.Date;
import java.util.List;

import com.mvc.model.Inventory;



public interface InventoryDao {

	List<Inventory> findByAll();
	
	void saveInventory(Inventory inven);
	
	Inventory findById(Integer item_id);
	
	void deleteInventory(Integer item_id);
	
	List<Inventory> findAllByName(String item_name);
	
	
}
