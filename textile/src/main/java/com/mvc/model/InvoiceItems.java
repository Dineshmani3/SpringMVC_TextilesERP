package com.mvc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="invoice_items")
public class InvoiceItems implements Serializable {

	public InvoiceItems() {
		// TODO Auto-generated constructor stub
	}
	
	@Id@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column
	private Integer bill_no;
	
	@Column
	private String items;
	
	@Column
	private Float qty;

	@Column
	private Double MRP;

	@Column
	private Double sell_p;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBill_no() {
		return bill_no;
	}

	public void setBill_no(Integer bill_no) {
		this.bill_no = bill_no;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public Double getMRP() {
		return MRP;
	}

	public void setMRP(Double mRP) {
		MRP = mRP;
	}

	public Double getSell_p() {
		return sell_p;
	}

	public void setSell_p(Double sell_p) {
		this.sell_p = sell_p;
	}

	@Override
	public String toString() {
		return "InvoiceItems [id=" + id + ", bill_no=" + bill_no + ", items=" + items + ", qty=" + qty + ", MRP=" + MRP
				+ ", sell_p=" + sell_p + "]";
	}

	
}
