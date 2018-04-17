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
@Table(name="customer_acc")
public class CustomerAccount implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="cus_id" , unique=false, nullable=false)
	private Integer cus_id;
	
	@Column(name="bill_no" , unique=false)
	private Integer bill_no;
	
	@Column(name="debit" , unique=false)
	private Double debit;
	
	@Column(name="credit" , unique=false, nullable=false)
	private Double credit;
	
	@Column(name="balance" , unique=false)
	private Double balance;
	
	@Column(name="date" , unique=false, nullable=false)
	private Date date;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	

	public Integer getCus_id() {
		return cus_id;
	}

	public void setCus_id(Integer cus_id) {
		this.cus_id = cus_id;
	}

	public Integer getBill_no() {
		return bill_no;
	}

	public void setBill_no(Integer bill_no) {
		this.bill_no = bill_no;
	}

	public Double getDebit() {
		return debit;
	}

	public void setDebit(Double debit) {
		this.debit = debit;
	}

	public Double getCredit() {
		return credit;
	}

	public void setCredit(Double credit) {
		this.credit = credit;
	}

	
	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CustomerAccount [id=" + id + ", cus_id=" + cus_id + ", bill_no=" + bill_no + ", debit=" + debit
				+ ", credit=" + credit + ", balance=" + balance + ", date=" + date + "]";
	}

	
	
	
	
}
