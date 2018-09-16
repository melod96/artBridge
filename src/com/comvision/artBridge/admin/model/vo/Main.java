package com.comvision.artBridge.admin.model.vo;

import java.io.Serializable;

public class Main implements Serializable{
	
	private int board_no;
	
	public Main(){}

	public Main(int board_no) {
		super();
		this.board_no = board_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "Main [board_no=" + board_no + "]";
	}
	
	
	
	

}
