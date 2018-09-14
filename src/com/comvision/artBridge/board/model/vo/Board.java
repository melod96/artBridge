package com.comvision.artBridge.board.model.vo;

import java.sql.Date;

public class Board {

	private int bd_no;
	private int bd_type;
	private String bd_title;
	private String bd_content;
	private Date bd_date;
	private int mb_no;
	private Date modify_date;
	private int bd_status;
	
	public Board(){}

	public Board(int bd_no, int bd_type, String bd_title, String bd_content, Date bd_date, int mb_no,
			Date modify_date, int bd_status) {
		super();
		this.bd_no = bd_no;
		this.bd_type = bd_type;
		this.bd_title = bd_title;
		this.bd_content = bd_content;
		this.bd_date = bd_date;
		this.mb_no = mb_no;
		this.modify_date = modify_date;
		this.bd_status = bd_status;
	}

	@Override
	public String toString() {
		return "Board [bd_no=" + bd_no + ", bd_type=" + bd_type + ", bd_title=" + bd_title + ", bd_content="
				+ bd_content + ", bd_date=" + bd_date + ", mb_no=" + mb_no + ", modify_date=" + modify_date
				+ ", bd_status=" + bd_status + "]";
	}

	public int getBd_no() {
		return bd_no;
	}

	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}

	public int getBd_type() {
		return bd_type;
	}

	public void setBd_type(int bd_type) {
		this.bd_type = bd_type;
	}

	public String getBd_title() {
		return bd_title;
	}

	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}

	public String getBd_content() {
		return bd_content;
	}

	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}

	public Date getBd_date() {
		return bd_date;
	}

	public void setBd_date(Date bd_date) {
		this.bd_date = bd_date;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public int getBd_status() {
		return bd_status;
	}

	public void setBd_status(int bd_status) {
		this.bd_status = bd_status;
	}
	
	
	
	
	
}
