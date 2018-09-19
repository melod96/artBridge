package com.comvision.artBridge.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7606455038780072621L;
	
	private int member_no;
	private String id;
	private String password;
	private String name;
	private int admin_right;
	private String token;
	private String phone;
	private String email;
	private String nick_name;
	private Date enroll_date;
	private Date rogin_date;
	private int writer_right;
	private String introduction;
	private String Bank;
	private String account;
	private Date writer_date;
	private int reception_status;
	private int writer_slot;
	private int rating_no;
	private String rating_name;
	
	public Member(){}

	public Member(int member_no, String id, String password, String name, int admin_right, String token, String phone,
			String email, String nick_name, Date enroll_date, Date rogin_date, int writer_right, String introduction,
			String bank, String account, Date writer_date, int reception_status, int writer_slot, int rating_no,
			String rating_name) {
		super();
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.admin_right = admin_right;
		this.token = token;
		this.phone = phone;
		this.email = email;
		this.nick_name = nick_name;
		this.enroll_date = enroll_date;
		this.rogin_date = rogin_date;
		this.writer_right = writer_right;
		this.introduction = introduction;
		Bank = bank;
		this.account = account;
		this.writer_date = writer_date;
		this.reception_status = reception_status;
		this.writer_slot = writer_slot;
		this.rating_no = rating_no;
		this.rating_name = rating_name;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAdmin_right() {
		return admin_right;
	}

	public void setAdmin_right(int admin_right) {
		this.admin_right = admin_right;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getRogin_date() {
		return rogin_date;
	}

	public void setRogin_date(Date rogin_date) {
		this.rogin_date = rogin_date;
	}

	public int getWriter_right() {
		return writer_right;
	}

	public void setWriter_right(int writer_right) {
		this.writer_right = writer_right;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getBank() {
		return Bank;
	}

	public void setBank(String bank) {
		Bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getWriter_date() {
		return writer_date;
	}

	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}

	public int getReception_status() {
		return reception_status;
	}

	public void setReception_status(int reception_status) {
		this.reception_status = reception_status;
	}

	public int getWriter_slot() {
		return writer_slot;
	}

	public void setWriter_slot(int writer_slot) {
		this.writer_slot = writer_slot;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", admin_right=" + admin_right + ", token=" + token + ", phone=" + phone + ", email=" + email
				+ ", nick_name=" + nick_name + ", enroll_date=" + enroll_date + ", rogin_date=" + rogin_date
				+ ", writer_right=" + writer_right + ", introduction=" + introduction + ", Bank=" + Bank + ", account="
				+ account + ", writer_date=" + writer_date + ", reception_status=" + reception_status + ", writer_slot="
				+ writer_slot + ", rating_no=" + rating_no + ", rating_name=" + rating_name + "]";
	};
	
	
	
}
