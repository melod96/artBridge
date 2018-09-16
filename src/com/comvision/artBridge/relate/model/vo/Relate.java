package com.comvision.artBridge.relate.model.vo;

import java.io.Serializable;

public class Relate implements Serializable{

	private int repate_no;
	private String relate_name;
	
	public Relate(){
		
	}

	public Relate(int repate_no, String relate_name) {
		super();
		this.repate_no = repate_no;
		this.relate_name = relate_name;
	}

	public int getRepate_no() {
		return repate_no;
	}

	public void setRepate_no(int repate_no) {
		this.repate_no = repate_no;
	}

	public String getRelate_name() {
		return relate_name;
	}

	public void setRelate_name(String relate_name) {
		this.relate_name = relate_name;
	}

	@Override
	public String toString() {
		return "Relate [repate_no=" + repate_no + ", relate_name=" + relate_name + "]";
	}
	
	
}
