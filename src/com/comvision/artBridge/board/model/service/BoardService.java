package com.comvision.artBridge.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class BoardService {

	public ArrayList<Board> selecNoticetList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNoticeList(con);
		
		close(con);
		
		System.out.println(list + "service");
		
		return list;
	}

}
