package com.comvision.artBridge.writer.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.writer.model.dao.WriterDao;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class WriterService {

	//작가 작품관리 리스트 출력
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new WriterDao().selectList(con, currentPage, limit);

		close(con);
		
		return list;
	}

	//페이징처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new WriterDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

}
