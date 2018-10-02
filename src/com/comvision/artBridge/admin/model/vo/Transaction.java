package com.comvision.artBridge.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Transaction implements Serializable{
	private int divRole_no;	//판매자,구매자 구분(구매1, 판매0)
	private int orders_no; //거래번호
	private String cusName; //구매자이름
	private String cusId; //구매자아이디
	private String wrtNick; //작가 닉네임
	private String wrtId; //작가 아이디
	private int pay_status; //진행상황 1번 2번 3번(결제대기 등등)  -
	private Date o_date; //거래접수일
	private Date o_final_date; //거래완료일
	private int payment; //결제금액    -
	private String board_title; //판매글명
	private Date od_startDate;	//활동 시작일   *
	private Date od_endDate;	//활동 종료일   *
	private int orders_activity; //주문활동 1.조율 2.1단계 작업시작 등등 *
	private int wrtNo;//작가 번호
	private int board_no; //판매글 번호
	private int cusNo;	//판매자 번호

	public Transaction(){}

	public Transaction(int divRole_no, int orders_no, String cusName, String cusId, String wrtNick, String wrtId,
			int pay_status, Date o_date, Date o_final_date, int payment, String board_title, Date od_startDate,
			Date od_endDate, int orders_activity, int wrtNo, int board_no, int cusNo) {
		super();
		this.divRole_no = divRole_no;
		this.orders_no = orders_no;
		this.cusName = cusName;
		this.cusId = cusId;
		this.wrtNick = wrtNick;
		this.wrtId = wrtId;
		this.pay_status = pay_status;
		this.o_date = o_date;
		this.o_final_date = o_final_date;
		this.payment = payment;
		this.board_title = board_title;
		this.od_startDate = od_startDate;
		this.od_endDate = od_endDate;
		this.orders_activity = orders_activity;
		this.wrtNo = wrtNo;
		this.board_no = board_no;
		this.cusNo = cusNo;
	}

	public int getDivRole_no() {
		return divRole_no;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public String getCusName() {
		return cusName;
	}

	public String getCusId() {
		return cusId;
	}

	public String getWrtNick() {
		return wrtNick;
	}

	public String getWrtId() {
		return wrtId;
	}

	public int getPay_status() {
		return pay_status;
	}

	public Date getO_date() {
		return o_date;
	}

	public Date getO_final_date() {
		return o_final_date;
	}

	public int getPayment() {
		return payment;
	}

	public String getBoard_title() {
		return board_title;
	}

	public Date getOd_startDate() {
		return od_startDate;
	}

	public Date getOd_endDate() {
		return od_endDate;
	}

	public int getOrders_activity() {
		return orders_activity;
	}

	public int getWrtNo() {
		return wrtNo;
	}

	public int getBoard_no() {
		return board_no;
	}

	public int getCusNo() {
		return cusNo;
	}

	public void setDivRole_no(int divRole_no) {
		this.divRole_no = divRole_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	public void setWrtNick(String wrtNick) {
		this.wrtNick = wrtNick;
	}

	public void setWrtId(String wrtId) {
		this.wrtId = wrtId;
	}

	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public void setO_final_date(Date o_final_date) {
		this.o_final_date = o_final_date;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public void setOd_startDate(Date od_startDate) {
		this.od_startDate = od_startDate;
	}

	public void setOd_endDate(Date od_endDate) {
		this.od_endDate = od_endDate;
	}

	public void setOrders_activity(int orders_activity) {
		this.orders_activity = orders_activity;
	}

	public void setWrtNo(int wrtNo) {
		this.wrtNo = wrtNo;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}

	@Override
	public String toString() {
		return "Transaction [divRole_no=" + divRole_no + ", orders_no=" + orders_no + ", cusName=" + cusName
				+ ", cusId=" + cusId + ", wrtNick=" + wrtNick + ", wrtId=" + wrtId + ", pay_status=" + pay_status
				+ ", o_date=" + o_date + ", o_final_date=" + o_final_date + ", payment=" + payment + ", board_title="
				+ board_title + ", od_startDate=" + od_startDate + ", od_endDate=" + od_endDate + ", orders_activity="
				+ orders_activity + ", wrtNo=" + wrtNo + ", board_no=" + board_no + ", cusNo=" + cusNo + "]";
	}

	

	

}
