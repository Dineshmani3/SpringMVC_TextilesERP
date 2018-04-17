package com.mvc.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.InventoryDao;
import com.mvc.model.Inventory;


@Service("inventoryService")
@Transactional
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryDao dao;
	
	public List<Inventory> findByAll(){
		return dao.findByAll();
	}
	
	public void saveInventory(Inventory inven){
		dao.saveInventory(inven);
	}
	
	public void updateInventory(Inventory inven){
		Inventory entity = dao.findById(inven.getItem_id());
		if(entity!=null){
				entity.setItem_id(inven.getItem_id());
				entity.setItem_name(inven.getItem_name());
				entity.setQuantity(inven.getQuantity());
				entity.setCost_price(inven.getCost_price());
				entity.setCash_rate(inven.getCash_rate());
				entity.setCredit_rate(inven.getCredit_rate());
		}
	}
	
	/*public void updateStock(Inventory inven) {
		Inventory entity = dao.findById(inven.getItem_id());
		if(entity!=null){
			if(inven.getType().equals("Add,")){
				entity.setQuantity(entity.getQuantity()+inven.getQuantity());
			}
			else {
				entity.setQuantity(entity.getQuantity()-inven.getQuantity());
			}
			
		}
	}*/
	
	public Inventory findById(Integer item_id){
		return dao.findById(item_id);
	}
	
	public void deleteInventory(Integer item_id){
		dao.deleteInventory(item_id);
	}

	public List<Inventory> findAllByName(String item_name) {
		return dao.findAllByName(item_name);
	}

	
}
