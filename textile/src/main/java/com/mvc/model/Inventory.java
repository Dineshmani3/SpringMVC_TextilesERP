package com.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="inventory")
public class Inventory {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer item_id;
	
	@Column(name="item_name")
	private String item_name;
	
	@Column(name="quantity")
	private Float quantity;
	
	@Column(name="cost_price")
	private Double cost_price;
	
	@Column(name="cash_rate")
	private Double cash_rate;
	
	@Column(name="credit_rate")
	private Double credit_rate;

	public Integer getItem_id() {
		return item_id;
	}

	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Double getCost_price() {
		return cost_price;
	}

	public void setCost_price(Double cost_price) {
		this.cost_price = cost_price;
	}

	public Double getCash_rate() {
		return cash_rate;
	}

	public void setCash_rate(Double cash_rate) {
		this.cash_rate = cash_rate;
	}

	public Double getCredit_rate() {
		return credit_rate;
	}

	public void setCredit_rate(Double credit_rate) {
		this.credit_rate = credit_rate;
	}

	@Override
	public String toString() {
		return "Inventory [item_id=" + item_id + ", item_name=" + item_name + ", quantity=" + quantity + ", cost_price="
				+ cost_price + ", cash_rate=" + cash_rate + ", credit_rate=" + credit_rate + "]";
	}
	
}
