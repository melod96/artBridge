package com.comvision.artBridge.transaction.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Transaction implements Serializable{
	
	private int orders_no; //거래번호
	private String cusName; //구매자이름
	private String cusId; //구매자아이디
	private String wrtNick; //작가 닉네임
	private String wrtId; //작가 아이디
	private int pay_status; //진행상황 1번 2번 3번(결제대기 등등)
	private Date o_date; //거래접수일
	private int payment; //결제금액
	private String board_title; //판매글명

	public Transaction(){}

	public Transaction(int orders_no, String cusName, String cusId, String wrtNick, String wrtId, int pay_status,
			Date o_date, int payment, String board_title) {
		super();
		this.orders_no = orders_no;
		this.cusName = cusName;
		this.cusId = cusId;
		this.wrtNick = wrtNick;
		this.wrtId = wrtId;
		this.pay_status = pay_status;
		this.o_date = o_date;
		this.payment = payment;
		this.board_title = board_title;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getCusId() {
		return cusId;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	public String getWrtNick() {
		return wrtNick;
	}

	public void setWrtNick(String wrtNick) {
		this.wrtNick = wrtNick;
	}

	public String getWrtId() {
		return wrtId;
	}

	public void setWrtId(String wrtId) {
		this.wrtId = wrtId;
	}

	public int getPay_status() {
		return pay_status;
	}

	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	@Override
	public String toString() {
		return "Transaction [orders_no=" + orders_no + ", cusName=" + cusName + ", cusId=" + cusId + ", wrtNick="
				+ wrtNick + ", wrtId=" + wrtId + ", pay_status=" + pay_status + ", o_date=" + o_date + ", payment="
				+ payment + ", board_title=" + board_title + "]";
	}
	
	
	
}
