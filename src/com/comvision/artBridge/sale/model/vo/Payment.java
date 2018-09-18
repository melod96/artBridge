package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;

public class Payment implements Serializable{
	private int payment_no;
	private int orders_no;
	private int member_no;
	private int payment;
	
	public Payment(){
		
	}

	public Payment(int payment_no, int orders_no, int member_no, int payment) {
		super();
		this.payment_no = payment_no;
		this.orders_no = orders_no;
		this.member_no = member_no;
		this.payment = payment;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "Payment [payment_no=" + payment_no + ", orders_no=" + orders_no + ", member_no=" + member_no
				+ ", payment=" + payment + "]";
	}
	
	
}
