package com.mvc.model;

public class CustomerTag {

	public Integer id;
	public String customer_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	public CustomerTag(Integer id, String customer_name) {
		this.id=id;
		this.customer_name = customer_name;
	}

}
