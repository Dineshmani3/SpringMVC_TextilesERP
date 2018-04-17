package com.mvc.model;

import java.sql.Date;

public class BillDate {

	Date date1;
	Date date2;
	public Date getDate1() {
		return date1;
	}
	public void setDate1(Date date1) {
		this.date1 = date1;
	}
	public Date getDate2() {
		return date2;
	}
	public void setDate2(Date date2) {
		this.date2 = date2;
	}
	@Override
	public String toString() {
		return "BillDate [date1=" + date1 + ", date2=" + date2 + "]";
	}
	
	public BillDate(){
		
	}
	public BillDate(Date date1, Date date2) {
		this.date1 = date1;
		this.date2 = date2;
	}
}
