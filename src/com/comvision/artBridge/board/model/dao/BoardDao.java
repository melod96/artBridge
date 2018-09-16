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
			System.out.println("dao: " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

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
	
	
	
}
