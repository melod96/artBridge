package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Orders_detail implements Serializable{
	private int orders_detail_no;
	private int orders_no;
	private int orders_activity;
	private Date od_start_date;
	private Date od_end_date;
	
	public Orders_detail(){
		
	}

	public Orders_detail(int orders_detail_no, int orders_no, int orders_activity, Date od_start_date,
			Date od_end_date) {
		super();
		this.orders_detail_no = orders_detail_no;
		this.orders_no = orders_no;
		this.orders_activity = orders_activity;
		this.od_start_date = od_start_date;
		this.od_end_date = od_end_date;
	}

	public int getOrders_detail_no() {
		return orders_detail_no;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public int getOrders_activity() {
		return orders_activity;
	}

	public Date getOd_start_date() {
		return od_start_date;
	}

	public Date getOd_end_date() {
		return od_end_date;
	}

	public void setOrders_detail_no(int orders_detail_no) {
		this.orders_detail_no = orders_detail_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public void setOrders_activity(int orders_activity) {
		this.orders_activity = orders_activity;
	}

	public void setOd_start_date(Date od_start_date) {
		this.od_start_date = od_start_date;
	}

	public void setOd_end_date(Date od_end_date) {
		this.od_end_date = od_end_date;
	}

	@Override
	public String toString() {
		return "Orders_detail [orders_detail_no=" + orders_detail_no + ", orders_no=" + orders_no + ", orders_activity="
				+ orders_activity + ", od_start_date=" + od_start_date + ", od_end_date=" + od_end_date + "]";
	}
	
	
}
