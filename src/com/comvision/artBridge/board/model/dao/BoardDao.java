package com.comvision.artBridge.board.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;


public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName= BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//페이징처리
	public int getListCount(Connection con, String addQuery) {
		Statement stmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		query += addQuery;
		
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	//판매글 출력
	public ArrayList<Board> selectSaleList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		
		String query = prop.getProperty("selectSaleList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setMember_no(rset.getInt("member_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setBoard_status(rset.getInt("board_status"));
				b.setBoard_count(rset.getInt("board_count"));
				b.setMain_view(rset.getInt("main_view"));
				
				list.add(b);
			}
//			System.out.println("dao: " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//최저가 정렬
	public ArrayList<Board> selectSaleChangeList(Connection con, int currentPage, int limit, String query2) {
//		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectSaleChangeList");
		
		try {
			stmt = con.createStatement();
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
//			?))WHERE RNUM BETWEEN ? AND ?
			query += query2 + ")) WHERE RNUM BETWEEN " + startRow + " and " + endRow;
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setMember_no(rset.getInt("member_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setBoard_status(rset.getInt("board_status"));
				b.setBoard_count(rset.getInt("board_count"));
				b.setMain_view(rset.getInt("main_view"));
				
				list.add(b);
			}
//			System.out.println("dao: " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return list;
	}
	
	
	//연관검색어 출력
	public ArrayList<Relate> selectRelateList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Relate> rlist = null;
		
		String query = prop.getProperty("selectRelateList");
		
		try {
			stmt = con.createStatement();
			rset =stmt.executeQuery(query);
			
			rlist = new ArrayList<Relate>();
			
			while(rset.next()){
				Relate r = new Relate();
				
				r.setRelate_name(rset.getString("relate_name"));
				
				
				rlist.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return rlist;
	}

	//키워드에 해당하는 판매글 검색
	public ArrayList<Board> searchKeywordList(Connection con, int currentPage, int limit, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchKeywordList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			System.out.println("s" + startRow + "e" + endRow);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			System.out.println("???"+search);
			pstmt.setString(3, "%"+search+"%" );
			pstmt.setString(4, "%"+search+"%");
			pstmt.setString(5, "%"+search+"%");
			
			rset= pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			while(rset.next()){
				Board b = new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setBoard_status(rset.getInt("board_status"));
				
				list.add(b);
				
			}
			System.out.println("??"+list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//키워드에 해당하는 판매글의 갯수
	public int getKeywordListCount(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("KeywordListCount");
		
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			
			rset= pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	//조회수 카운트
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int getListSearchCount(Connection con, String kind, String keyword) {
		
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String query = null;
		if(kind=="board_no"){
		query = prop.getProperty("ListSearchNoCount");
		}else{
		query = prop.getProperty("ListSearchCount");	
		}
		
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, kind);
			pstmt.setString(2, keyword);
			
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

	public int getListpgCount(Connection con) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}



	
}
