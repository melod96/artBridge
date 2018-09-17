package com.comvision.artBridge.admin.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.AdminDao;
import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;

public class AdminService {

	public ArrayList<Board> selectSaleList(int currentPage, int limit) {
	Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectSaleList(con,currentPage, limit);
		
		close(con);
		
		return list;
		
	}
	

}
