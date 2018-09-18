package com.comvision.artBridge.board.model.service;


import static com.comvision.artBridge.common.JDBCTemplate.*;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.sale.model.vo.Options;

public class BoardService {

	//페이징처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//판매글 출력
	public ArrayList<Board> selectSaleList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSaleList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}
	//최저가 정렬
	public ArrayList<Board> selectCheapList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectCheapList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//최고가 정렬
	public ArrayList<Board> selectExpensiveList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectExpensiveList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//거래완료율 정렬
	public ArrayList<Board> selectCredibilityList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectCredibilityList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}

	//별점 정렬
	public ArrayList<Board> selectStarList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectStarList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}

	//판매글에 해당하는 이미지 출력
	public HashMap<String, Object> selectFileList(ArrayList<Board> list) {
		Connection con = getConnection();
		
		HashMap<String, Object> filelist = new BoardDao().selectFileList(con,list);
		
		close(con);
		
		return filelist;
	}

	//연관검색어 출력
	public ArrayList<Relate> selectRelateList() {
		Connection con = getConnection();
		
		ArrayList<Relate> rlist = new BoardDao().selectRelateList(con);
		
		close(con);
		
		
		return rlist;
	}

	//키워드에 해당하는 판매글 검색
	public ArrayList<Board> searchKeywordList(int currentPage, int limit, String search) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchKeywordList(con,currentPage, limit,search);
		
		close(con);
		return list;
	}
	//키워드에 해당하는 판매글의 갯수
	public int getKeywordListCount(String search) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getKeywordListCount(con,search);
		
		close(con);
		
		return listCount;
	}

	

}
