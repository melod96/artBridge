package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Requirements implements Serializable{
	private int requirements_no;
	private int orders_no;
	private int member_no;
	private String requirements_content;
	private int requirement_price;
	private int requirement_approval;
	private Date requirement_date;
	
	public Requirements(){
		
	}

	public Requirements(int requirements_no, int orders_no, int member_no, String requirements_content,
			int requirement_price, int requirement_approval, Date requirement_date) {
		super();
		this.requirements_no = requirements_no;
		this.orders_no = orders_no;
		this.member_no = member_no;
		this.requirements_content = requirements_content;
		this.requirement_price = requirement_price;
		this.requirement_approval = requirement_approval;
		this.requirement_date = requirement_date;
	}

	public int getRequirements_no() {
		return requirements_no;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public String getRequirements_content() {
		return requirements_content;
	}

	public int getRequirement_price() {
		return requirement_price;
	}

	public int getRequirement_approval() {
		return requirement_approval;
	}

	public Date getRequirement_date() {
		return requirement_date;
	}

	public void setRequirements_no(int requirements_no) {
		this.requirements_no = requirements_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setRequirements_content(String requirements_content) {
		this.requirements_content = requirements_content;
	}

	public void setRequirement_price(int requirement_price) {
		this.requirement_price = requirement_price;
	}

	public void setRequirement_approval(int requirement_approval) {
		this.requirement_approval = requirement_approval;
	}

	public void setRequirement_date(Date requirement_date) {
		this.requirement_date = requirement_date;
	}

	@Override
	public String toString() {
		return "Requirements [requirements_no=" + requirements_no + ", orders_no=" + orders_no + ", member_no="
				+ member_no + ", requirements_content=" + requirements_content + ", requirement_price="
				+ requirement_price + ", requirement_approval=" + requirement_approval + ", requirement_date="
				+ requirement_date + "]";
	}
	
	
}
