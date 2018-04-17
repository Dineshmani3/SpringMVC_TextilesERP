package com.mvc.service;

import java.sql.Date;
import java.util.List;

import com.mvc.model.Inventory;

public interface InventoryService {

	List<Inventory> findByAll();
	
	void saveInventory(Inventory inven);
	
	void updateInventory(Inventory inven);
	
	//void updateStock(Inventory inven);
	
	List<Inventory> findAllByName(String item_name);
	
	
	Inventory findById(Integer item_id);
	
	void deleteInventory(Integer item_id);
}
