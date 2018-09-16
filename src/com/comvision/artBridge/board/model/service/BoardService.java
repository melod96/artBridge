package com.comvision.artBridge.board.model.service;


import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;

public class BoardService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectFileList(ArrayList<Board> list) {
		Connection con = getConnection();
		
		HashMap<String, Object> filelist = new BoardDao().selectFileList(con,list);
		
		close(con);
		
		return filelist;
	}

}
