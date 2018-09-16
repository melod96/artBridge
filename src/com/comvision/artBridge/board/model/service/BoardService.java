package com.comvision.artBridge.board.model.service;


import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;

public class BoardService {

	//페이징처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//판매글 출력
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con,currentPage, limit);
		
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
	public ArrayList<Board> searchKeywordList(String search) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchKeywordList(con,search);
		
		close(con);
		return list;
	}

}
