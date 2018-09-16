package com.comvision.artBridge.files.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Files implements Serializable{
	private int files_no;
	private int f_reference_no;
	private String files_title;
	private String change_title;
	private String files_type;
	private String files_root;
	private Date files_date;
	private int files_secession;
	
	public Files(){
		
	}

	public Files(int files_no, int f_reference_no, String files_title, String change_title, String files_type,
			String files_root, Date files_date, int files_secession) {
		super();
		this.files_no = files_no;
		this.f_reference_no = f_reference_no;
		this.files_title = files_title;
		this.change_title = change_title;
		this.files_type = files_type;
		this.files_root = files_root;
		this.files_date = files_date;
		this.files_secession = files_secession;
	}

	public int getFiles_no() {
		return files_no;
	}

	public int getF_reference_no() {
		return f_reference_no;
	}

	public String getFiles_title() {
		return files_title;
	}

	public String getChange_title() {
		return change_title;
	}

	public String getFiles_type() {
		return files_type;
	}

	public String getFiles_root() {
		return files_root;
	}

	public Date getFiles_date() {
		return files_date;
	}

	public int getFiles_secession() {
		return files_secession;
	}

	public void setFiles_no(int files_no) {
		this.files_no = files_no;
	}

	public void setF_reference_no(int f_reference_no) {
		this.f_reference_no = f_reference_no;
	}

	public void setFiles_title(String files_title) {
		this.files_title = files_title;
	}

	public void setChange_title(String change_title) {
		this.change_title = change_title;
	}

	public void setFiles_type(String files_type) {
		this.files_type = files_type;
	}

	public void setFiles_root(String files_root) {
		this.files_root = files_root;
	}

	public void setFiles_date(Date files_date) {
		this.files_date = files_date;
	}

	public void setFiles_secession(int files_secession) {
		this.files_secession = files_secession;
	}

	@Override
	public String toString() {
		return "Files [files_no=" + files_no + ", f_reference_no=" + f_reference_no + ", files_title=" + files_title
				+ ", change_title=" + change_title + ", files_type=" + files_type + ", files_root=" + files_root
				+ ", files_date=" + files_date + ", files_secession=" + files_secession + "]";
	}

	
}
