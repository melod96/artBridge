package com.comvision.artBridge.comments.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comments implements Serializable{
	private int comments_no;
	private int c_reference_no;
	private String comments_content;
	private Date comments_date;
	
	public Comments(){
		
	}

	public Comments(int comments_no, int c_reference_no, String comments_content, Date comments_date) {
		super();
		this.comments_no = comments_no;
		this.c_reference_no = c_reference_no;
		this.comments_content = comments_content;
		this.comments_date = comments_date;
	}

	public int getComments_no() {
		return comments_no;
	}

	public void setComments_no(int comments_no) {
		this.comments_no = comments_no;
	}

	public int getC_reference_no() {
		return c_reference_no;
	}

	public void setC_reference_no(int c_reference_no) {
		this.c_reference_no = c_reference_no;
	}

	public String getComments_content() {
		return comments_content;
	}

	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}

	public Date getComments_date() {
		return comments_date;
	}

	public void setComments_date(Date comments_date) {
		this.comments_date = comments_date;
	}

	@Override
	public String toString() {
		return "Comments [comments_no=" + comments_no + ", c_reference_no=" + c_reference_no + ", comments_content="
				+ comments_content + ", comments_date=" + comments_date + "]";
	}
	
}
