package com.mvc.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="invoice")
public class Invoice implements Serializable {

	@Id@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bill_no;
	
	@Column
	private Integer cusId;
	
	@Column
	private Date date;
	
	@Column
	private Double bill_amount;

	public Integer getBill_no() {
		return bill_no;
	}

	public void setBill_no(Integer bill_no) {
		this.bill_no = bill_no;
	}

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getBill_amount() {
		return bill_amount;
	}

	public void setBill_amount(Double bill_amount) {
		this.bill_amount = bill_amount;
	}

	
	
}
