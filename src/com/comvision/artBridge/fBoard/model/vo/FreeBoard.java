package com.comvision.artBridge.fBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import javafx.scene.chart.PieChart.Data;

public class FreeBoard implements Serializable{
	private int board_no; //게시글번호
	private String board_title; //게시글제목
	private String nick_name; //작성자
	private int board_count; //조회수
	private Date board_date; //등록일자
	private int board_type;			//게시글유형 3.자유게시판
	private String board_content;	//게시글내용
	private int member_no;		//작가번호
	private Date modify_Date; //수정일
	private int board_status;		//게시글상태 0.미삭제 1.삭제
	private int main_view; //메인 노출 여부
	private int rownum;
	
	public FreeBoard(){}
	
	public FreeBoard(int board_no, String board_title, String nick_name, int board_count, Date board_date,
			int board_type, String board_content, int member_no, Date modify_Date, int board_status, int main_view, int rownum) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.nick_name = nick_name;
		this.board_count = board_count;
		this.board_date = board_date;
		this.board_type = board_type;
		this.board_content = board_content;
		this.member_no = member_no;
		this.modify_Date = modify_Date;
		this.board_status = board_status;
		this.main_view = main_view;
		this.rownum = rownum;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getModify_Date() {
		return modify_Date;
	}
	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}
	public int getBoard_status() {
		return board_status;
	}
	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}
	public int getMain_view() {
		return main_view;
	}
	public void setMain_view(int main_view) {
		this.main_view = main_view;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "FreeBoard [board_no=" + board_no + ", board_title=" + board_title + ", nick_name=" + nick_name
				+ ", board_count=" + board_count + ", board_date=" + board_date + ", board_type=" + board_type
				+ ", board_content=" + board_content + ", member_no=" + member_no + ", modify_Date=" + modify_Date
				+ ", board_status=" + board_status + ", main_view=" + main_view + ", rownum=" + rownum + "]";
	}

	
	
}
