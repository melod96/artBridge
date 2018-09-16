package com.comvision.artBridge.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class BoardService {

	public ArrayList<Board> selecNoticetList_main() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNoticeList_main(con);
		
		close(con);
		
		
		return list;
	}
	
	
	
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

}
