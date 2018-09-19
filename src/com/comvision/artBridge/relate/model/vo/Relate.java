package com.comvision.artBridge.relate.model.vo;

import java.io.Serializable;

public class Relate implements Serializable{

	private int relate_no;
	private String relate_name;
	
	public Relate(){
		
	}

	public Relate(int relate_no, String relate_name) {
		super();
		this.relate_no = relate_no;
		this.relate_name = relate_name;
	}

	public int getRelate_no() {
		return relate_no;
	}

	public void setRelate_no(int relate_no) {
		this.relate_no = relate_no;
	}

	public String getRelate_name() {
		return relate_name;
	}

	public void setRelate_name(String relate_name) {
		this.relate_name = relate_name;
	}

	@Override
	public String toString() {
		return "Relate [relate_no=" + relate_no + ", relate_name=" + relate_name + "]";
	}

	
	
	
}
