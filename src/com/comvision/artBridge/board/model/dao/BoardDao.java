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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	//판매글 출력
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
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
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setBoard_status(rset.getInt("board_status"));
				
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

	//판매글에 해당하는 이미지 출력
	public HashMap<String, Object> selectFileList(Connection con, ArrayList<Board> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Files> flist = null;
		HashMap<String, Object> filelist = null;
		Board b= null;
		Files f= null;
		
		String query = prop.getProperty("selectFileList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i<list.size(); i++){
				pstmt.setInt(1, list.get(i).getBoard_no());
				
				rset = pstmt.executeQuery();
				
				flist= new ArrayList<Files>();
				
				while(rset.next()){
					b = new Board();
					b.setBoard_no(rset.getInt("board_no"));
					b.setBoard_title(rset.getString("board_title"));
					b.setBoard_content(rset.getString("board_content"));
					b.setNick_name(rset.getString("nick_name"));
					
					f = new Files();
					
					f.setFiles_root(rset.getString("files_root"));
					
					flist.add(f);
				}
				
				filelist = new HashMap<String,Object>();
				filelist.put("board", b);
				filelist.put("files", flist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return filelist;
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
	public ArrayList<Board> searchKeywordList(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchKeywordList");
		
		try {
			pstmt = con.prepareStatement(query);
			/*pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);*/
			
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
	
	
	
}
