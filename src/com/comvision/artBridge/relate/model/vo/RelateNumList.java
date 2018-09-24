package com.comvision.artBridge.relate.model.vo;

import java.io.Serializable;

public class RelateNumList implements Serializable{

	//판매글에 등록되는 연관검색어 목록
	private int r_n_list_no;	//연관검색어목록번호
	private int board_no;		//판매글번호
	private int relate_no;		//연관섬색어번호
	
	public RelateNumList(){}

	public RelateNumList(int r_n_list_no, int board_no, int relate_no) {
		super();
		this.r_n_list_no = r_n_list_no;
		this.board_no = board_no;
		this.relate_no = relate_no;
	}

	public int getR_n_list_no() {
		return r_n_list_no;
	}

	public void setR_n_list_no(int r_n_list_no) {
		this.r_n_list_no = r_n_list_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getRelate_no() {
		return relate_no;
	}

	public void setRelate_no(int relate_no) {
		this.relate_no = relate_no;
	}

	@Override
	public String toString() {
		return "RelateNumList [r_n_list_no=" + r_n_list_no + ", board_no=" + board_no + ", relate_no=" + relate_no
				+ "]";
	}

}
