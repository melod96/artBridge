package com.comvision.artBridge.admin.model.vo;

public class Rating {

	private int rating_no;
	private String rating_name;
	private int slot;
	private int commission;
	
	public Rating(){}

	public Rating(int rating_no, String rating_name, int slot, int commission) {
		super();
		this.rating_no = rating_no;
		this.rating_name = rating_name;
		this.slot = slot;
		this.commission = commission;
	}

	public int getRating_no() {
		return rating_no;
	}

	public void setRating_no(int rating_no) {
		this.rating_no = rating_no;
	}

	public String getRating_name() {
		return rating_name;
	}

	public void setRating_name(String rating_name) {
		this.rating_name = rating_name;
	}

	public int getSlot() {
		return slot;
	}

	public void setSlot(int slot) {
		this.slot = slot;
	}

	public int getCommission() {
		return commission;
	}

	public void setCommission(int commission) {
		this.commission = commission;
	}

	@Override
	public String toString() {
		return "Rating [rating_no=" + rating_no + ", rating_name=" + rating_name + ", slot=" + slot + ", commission="
				+ commission + "]";
	}
	
	
}
