package com.mvc.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="customer_details")
public class CustomerBean {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer cusId;
	
	@Column(name="cus_name")
	private String cus_name;
	
	@Column(name="contact_no")
	private String contact_no;
	
	@Column(name="address")
	private String address;
	
	@Column(name="balance")
	private Double balance;

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "CustomerBean [cusId=" + cusId + ", cus_name=" + cus_name + ", contact_no=" + contact_no + ", address="
				+ address + ", balance=" + balance + "]";
	}

	
}
