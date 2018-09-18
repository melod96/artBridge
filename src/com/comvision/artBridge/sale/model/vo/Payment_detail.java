package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment_detail implements Serializable{
	private int payment_detail_no;
	private int payment_no;
	private int pay_status;
	private Date pay_date;
	private int refundment_Rate;
	
	public Payment_detail(){
		
	}

	public Payment_detail(int payment_detail_no, int payment_no, int pay_status, Date pay_date, int refundment_Rate) {
		super();
		this.payment_detail_no = payment_detail_no;
		this.payment_no = payment_no;
		this.pay_status = pay_status;
		this.pay_date = pay_date;
		this.refundment_Rate = refundment_Rate;
	}

	public int getPayment_detail_no() {
		return payment_detail_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public int getPay_status() {
		return pay_status;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public int getRefundment_Rate() {
		return refundment_Rate;
	}

	public void setPayment_detail_no(int payment_detail_no) {
		this.payment_detail_no = payment_detail_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public void setRefundment_Rate(int refundment_Rate) {
		this.refundment_Rate = refundment_Rate;
	}

	@Override
	public String toString() {
		return "Payment_detail [payment_detail_no=" + payment_detail_no + ", payment_no=" + payment_no + ", pay_status="
				+ pay_status + ", pay_date=" + pay_date + ", refundment_Rate=" + refundment_Rate + "]";
	}
	
	
}
