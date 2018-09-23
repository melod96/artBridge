package com.comvision.artBridge.grade.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Grade implements Serializable{
	private int greade_no;
	private int board_no;
	private int member_no;
	private int grade;
	private String grade_content;
	private Date grade_date;
	private String nick_name;
	
	public Grade(){
		
	}

	public Grade(int greade_no, int board_no, int member_no, int grade, String grade_content, Date grade_date,
			String nick_name) {
		super();
		this.greade_no = greade_no;
		this.board_no = board_no;
		this.member_no = member_no;
		this.grade = grade;
		this.grade_content = grade_content;
		this.grade_date = grade_date;
		this.nick_name = nick_name;
	}

	public int getGreade_no() {
		return greade_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public double getGrade() {
		return grade;
	}

	public String getGrade_content() {
		return grade_content;
	}

	public Date getGrade_date() {
		return grade_date;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setGreade_no(int greade_no) {
		this.greade_no = greade_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setGrade_content(String grade_content) {
		this.grade_content = grade_content;
	}

	public void setGrade_date(Date grade_date) {
		this.grade_date = grade_date;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	@Override
	public String toString() {
		return "Grade [greade_no=" + greade_no + ", board_no=" + board_no + ", member_no=" + member_no + ", grade="
				+ grade + ", grade_content=" + grade_content + ", grade_date=" + grade_date + ", nick_name=" + nick_name
				+ "]";
	}

	
}