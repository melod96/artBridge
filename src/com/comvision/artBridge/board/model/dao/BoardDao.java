package com.comvision.artBridge.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.comvision.artBridge.common.JDBCTemplate.*;
import com.comvision.artBridge.board.model.vo.Board;

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName 
		= BoardDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectNoticeList(Connection con) {
		
		ArrayList<Board> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBd_no(rset.getInt("BOARD_NO"));
				b.setBd_title(rset.getString("BOARD_TITLE"));
				b.setBd_date(rset.getDate("BOARD_DATE"));
				
				list.add(b);
				
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		
		System.out.println(list + "dao");
		
		
		return list;
	}

}
