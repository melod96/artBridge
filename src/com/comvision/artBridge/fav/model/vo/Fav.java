package com.comvision.artBridge.fav.model.vo;

import java.io.Serializable;

public class Fav implements Serializable{
	private int fav_no;
	private int member_no;
	private int writer_no;
	
	public Fav(){
		
	}

	public Fav(int fav_no, int member_no, int writer_no) {
		super();
		this.fav_no = fav_no;
		this.member_no = member_no;
		this.writer_no = writer_no;
	}

	public int getFav_no() {
		return fav_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setFav_no(int fav_no) {
		this.fav_no = fav_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	@Override
	public String toString() {
		return "Fav [fav_no=" + fav_no + ", member_no=" + member_no + ", writer_no=" + writer_no + "]";
	}
	
}
