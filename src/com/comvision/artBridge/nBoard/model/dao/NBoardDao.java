package com.comvision.artBridge.nBoard.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.board.model.vo.Board;



public class NBoardDao {
	
	private Properties prop = new Properties();
	
	public NBoardDao(){
		String fileName= NBoardDao.class.getResource("/sql/nboard/nboard-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con) {
		
		Statement stmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				Notice n = new Notice();
				n.setRownum(rset.getInt(1));
				n.setnNo(rset.getInt("board_no"));
				n.setnType(rset.getInt("board_type"));
				n.setnTitle(rset.getString("board_title"));
				n.setnContent(rset.getString("board_content"));
				n.setnDate(rset.getDate("board_date"));
				n.setModifyDate(rset.getDate("modify_date"));
				n.setnStatus(rset.getInt("board_status"));
				n.setnCount(rset.getInt("board_count"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		System.out.println("dao list : " + list);
		return list;
		
	}

	public Notice selectOne(Connection con, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectNoticeDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				n = new Notice();
				
				n.setnNo(rset.getInt("board_no"));
				n.setnType(rset.getInt("board_type"));
				n.setnTitle(rset.getString("board_title"));
				n.setnContent(rset.getString("board_content"));
				n.setnDate(rset.getDate("board_date"));
				n.setModifyDate(rset.getDate("modify_date"));
				n.setnStatus(rset.getInt("board_status"));
				n.setnCount(rset.getInt("board_count"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
		
		
		
		
	}

	public int updateCount(Connection con, int getnNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("noticeUpdateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getnNo);
			pstmt.setInt(2, getnNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
		
		
		
		
	}

	public ArrayList<Notice> searchNotice(int currentPage, int limit, Connection con, String search) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("searchNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				Notice n = new Notice();
				n.setRownum(rset.getInt(1));
				n.setnNo(rset.getInt("board_no"));
				n.setnType(rset.getInt("board_type"));
				n.setnTitle(rset.getString("board_title"));
				n.setnContent(rset.getString("board_content"));
				n.setnDate(rset.getDate("board_date"));
				n.setModifyDate(rset.getDate("modify_date"));
				n.setnStatus(rset.getInt("board_status"));
				n.setnCount(rset.getInt("board_count"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int getSearchListCount(Connection con, String search) {
		
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("SearchlistCount");
		
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return listCount;
		
		
		
		
		
		
	}



	
	
	
	
	
}
