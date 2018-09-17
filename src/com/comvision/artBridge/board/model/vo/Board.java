package com.comvision.artBridge.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	private int board_no;
	private int board_type;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int member_no;
	private Date modify_date;
	private int board_status;
	private String nick_name;
	private int board_count;
	private int main_view;
	
	
	public Board(){
		
	}

	public Board(int board_no, int board_type, String board_title, String board_content, Date board_date, int member_no,
			Date modify_date, int board_status, String nick_name, int board_count, int main_view) {
		super();
		this.board_no = board_no;
		this.board_type = board_type;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.member_no = member_no;
		this.modify_date = modify_date;
		this.board_status = board_status;
		this.nick_name = nick_name;
		this.board_count = board_count;
		this.main_view = main_view;
	}

	public int getBoard_no() {
		return board_no;
	}

	public int getBoard_type() {
		return board_type;
	}

	public String getBoard_title() {
		return board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public int getMember_no() {
		return member_no;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public int getBoard_status() {
		return board_status;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public int getMain_view() {
		return main_view;
	}

	public void setMain_view(int main_view) {
		this.main_view = main_view;
	}

	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_type=" + board_type + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_date=" + board_date + ", member_no=" + member_no
				+ ", modify_date=" + modify_date + ", board_status=" + board_status + ", nick_name=" + nick_name
				+ ", board_count=" + board_count + ", main_view=" + main_view + "]";
	}

	
}
