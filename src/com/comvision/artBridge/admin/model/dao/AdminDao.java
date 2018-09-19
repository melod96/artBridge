package com.comvision.artBridge.admin.model.dao;

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

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.relate.model.vo.Relate;



public class AdminDao {
	
private Properties prop = new Properties();
	
	public AdminDao(){
		String fileName= AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//검색한 판매글 조회
	public ArrayList<Board> selectSaleList(Connection con, int currentPage, int limit, String kind, String keyword) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		String query = "";
		
		if(kind.equals("BOARD_NO")){
			 query = prop.getProperty("selectNoList");
		}else if(kind.equals("NICK_NAME")){
			 query = prop.getProperty("selectNameList");
		}else if(kind.equals("BOARD_TITLE")){
			 query = prop.getProperty("selectTitleList");
		}
		
		System.out.println(kind);
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			if(kind.equals("no")){
				pstmt.setInt(1, Integer.parseInt(keyword));
			}else{
			pstmt.setString(1, keyword);
			}
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_title(rset.getString("board_title"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//메인
	public int insertAdmin(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdmin");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoard_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	//연관검색어insert
	public int insertRelate(Connection con, Relate r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRelate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getRelate_no());
			pstmt.setString(2, r.getRelate_name());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	//연관검색어 전체 조회
	public ArrayList<Relate> selectRelate(Connection con) {
				Statement stmt = null;
				ResultSet rset = null;
				ArrayList<Relate> list = null;
				
				String query = prop.getProperty("selectRelate");
				
				try {
					stmt = con.createStatement();
					
					rset = stmt.executeQuery(query);
					
					list = new ArrayList<Relate>();
					
					while(rset.next()){
						Relate r = new Relate();
						
						r.setRelate_no(rset.getInt("relate_no"));
						r.setRelate_name(rset.getString("relate_name"));
					
						
						list.add(r);
						
					}
					
					//System.out.println("dao : " + list );
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally{
					close(stmt);
					close(rset);
				}
				//System.out.println("dao");
				return list;
	}
	

	
}

