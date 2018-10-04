package com.comvision.artBridge.message.model.vo;

import java.sql.Date;

public class Message {
	private int msg_no;
	private String msg_title;
	private String msg_content;
	private Date msg_date;
	private int dispatch_member_no;
	private int receive_member_no;
	private Date check_date;
	private String mem_name;
	private int writer_right;
	private int mem_no;
	private String receive_member_name;
	private String dispatch_member_name;
	private int sendWho;
	
	public Message(){}

	public Message(int msg_no, String msg_title, String msg_content, Date msg_date, int dispatch_member_no,
			int receive_member_no, Date check_date, String mem_name, int writer_right, int mem_no,
			String receive_member_name, String dispatch_member_name, int sendWho) {
		super();
		this.msg_no = msg_no;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_date = msg_date;
		this.dispatch_member_no = dispatch_member_no;
		this.receive_member_no = receive_member_no;
		this.check_date = check_date;
		this.mem_name = mem_name;
		this.writer_right = writer_right;
		this.mem_no = mem_no;
		this.receive_member_name = receive_member_name;
		this.dispatch_member_name = dispatch_member_name;
		this.sendWho = sendWho;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

	public int getDispatch_member_no() {
		return dispatch_member_no;
	}

	public void setDispatch_member_no(int dispatch_member_no) {
		this.dispatch_member_no = dispatch_member_no;
	}

	public int getReceive_member_no() {
		return receive_member_no;
	}

	public void setReceive_member_no(int receive_member_no) {
		this.receive_member_no = receive_member_no;
	}

	public Date getCheck_date() {
		return check_date;
	}

	public void setCheck_date(Date check_date) {
		this.check_date = check_date;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getWriter_right() {
		return writer_right;
	}

	public void setWriter_right(int writer_right) {
		this.writer_right = writer_right;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getReceive_member_name() {
		return receive_member_name;
	}

	public void setReceive_member_name(String receive_member_name) {
		this.receive_member_name = receive_member_name;
	}
	
	public String getDispatch_member_name() {
		return dispatch_member_name;
	}
	
	public void setDispatch_member_name(String dispatch_member_name) {
		this.dispatch_member_name = dispatch_member_name;
	}

	public int getSendWho() {
		return sendWho;
	}

	public void setSendWho(int sendWho) {
		this.sendWho = sendWho;
	}

	@Override
	public String toString() {
		return "Message [msg_no=" + msg_no + ", msg_title=" + msg_title + ", msg_content=" + msg_content + ", msg_date="
				+ msg_date + ", dispatch_member_no=" + dispatch_member_no + ", receive_member_no=" + receive_member_no
				+ ", check_date=" + check_date + ", mem_name=" + mem_name + ", writer_right=" + writer_right
				+ ", mem_no=" + mem_no + ", receive_member_name=" + receive_member_name + ", dispatch_member_name=" + dispatch_member_name + ", sendWho=" + sendWho + "]";
	}

	
	
}
