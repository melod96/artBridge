package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Orders implements Serializable{
	private int orders_no;
	private int member_no;
	private int board_no;
	private int writer_no;
	private Date o_start_date;
	private Date o_due_date;
	private int pre_orders_no;
	private Date o_final_date;
	
	public Orders(){
		
	}

	public Orders(int orders_no, int member_no, int board_no, int writer_no, Date o_start_date, Date o_due_date,
			int pre_orders_no, Date o_final_date) {
		super();
		this.orders_no = orders_no;
		this.member_no = member_no;
		this.board_no = board_no;
		this.writer_no = writer_no;
		this.o_start_date = o_start_date;
		this.o_due_date = o_due_date;
		this.pre_orders_no = pre_orders_no;
		this.o_final_date = o_final_date;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public Date getO_start_date() {
		return o_start_date;
	}

	public Date getO_due_date() {
		return o_due_date;
	}

	public int getPre_orders_no() {
		return pre_orders_no;
	}

	public Date getO_final_date() {
		return o_final_date;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public void setO_start_date(Date o_start_date) {
		this.o_start_date = o_start_date;
	}

	public void setO_due_date(Date o_due_date) {
		this.o_due_date = o_due_date;
	}

	public void setPre_orders_no(int pre_orders_no) {
		this.pre_orders_no = pre_orders_no;
	}

	public void setO_final_date(Date o_final_date) {
		this.o_final_date = o_final_date;
	}

	@Override
	public String toString() {
		return "Orders [orders_no=" + orders_no + ", member_no=" + member_no + ", board_no=" + board_no + ", writer_no="
				+ writer_no + ", o_start_date=" + o_start_date + ", o_due_date=" + o_due_date + ", pre_orders_no="
				+ pre_orders_no + ", o_final_date=" + o_final_date + "]";
	}
	
	
}
