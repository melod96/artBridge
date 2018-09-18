package com.comvision.artBridge.sale.model.vo;

import java.io.Serializable;

public class Options implements Serializable{
	private int options_no;
	private int board_no;
	private int member_no;
	private String options_name;
	private int options_price;
	
	public Options(){
		
	}

	public Options(int options_no, int board_no, int member_no, String options_name, int options_price) {
		super();
		this.options_no = options_no;
		this.board_no = board_no;
		this.member_no = member_no;
		this.options_name = options_name;
		this.options_price = options_price;
	}

	public int getOptions_no() {
		return options_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public String getOptions_name() {
		return options_name;
	}

	public int getOptions_price() {
		return options_price;
	}

	public void setOptions_no(int options_no) {
		this.options_no = options_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setOptions_name(String options_name) {
		this.options_name = options_name;
	}

	public void setOptions_price(int options_price) {
		this.options_price = options_price;
	}

	@Override
	public String toString() {
		return "Options [options_no=" + options_no + ", board_no=" + board_no + ", member_no=" + member_no
				+ ", options_name=" + options_name + ", options_price=" + options_price + "]";
	}
	
}
