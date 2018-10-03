package com.comvision.artBridge.fBoard.model.dao;

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

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;

public class FreeBoardDao {
	
private Properties prop = new Properties();
	
	public FreeBoardDao(){
		String fileName = NoticeDao.class.getResource("/sql/fBoard/fboard-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//자유게시판 등록용 메소드
	public int insertFreeBoard(Connection con, FreeBoard f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFreeBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getBoard_title());
			pstmt.setString(2, f.getBoard_content());
			pstmt.setInt(3, f.getMember_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	//자유게시판 리스트 출력
	public ArrayList<FreeBoard> selectFreeList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FreeBoard> list = null;
		FreeBoard f = null;

		String query = prop.getProperty("selectFreeBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<FreeBoard>();
			while(rset.next()){
				f = new FreeBoard();
				f.setRownum(rset.getInt(1));
				f.setBoard_no(rset.getInt("board_no"));
				f.setBoard_type(rset.getInt("board_type"));
				f.setBoard_title(rset.getString("board_title"));
				f.setBoard_content(rset.getString("board_content"));
				f.setMember_no(rset.getInt("member_no"));
				f.setBoard_date(rset.getDate("board_date"));
				f.setBoard_status(rset.getInt("board_status"));
				f.setBoard_count(rset.getInt("board_count"));
				f.setMain_view(rset.getInt("main_view"));
				f.setNick_name(rset.getString("nick_name"));
				
				list.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
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
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	//자유게시판 상세보기용 메소드
	public FreeBoard selectFreeOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FreeBoard f = null;
		
		String query = prop.getProperty("selectFreeBoardDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				f = new FreeBoard();
				
				f.setBoard_no(rset.getInt("board_no"));
				f.setBoard_type(rset.getInt("board_type"));
				f.setBoard_title(rset.getString("board_title"));
				f.setBoard_content(rset.getString("board_content"));
				f.setBoard_date(rset.getDate("board_date"));
				f.setMember_no(rset.getInt("member_no"));
				f.setModify_Date(rset.getDate("modify_date"));
				f.setBoard_status(rset.getInt("board_status"));
				f.setBoard_count(rset.getInt("board_count"));
				f.setMain_view(rset.getInt("main_view"));
				f.setNick_name(rset.getString("nick_name"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	}
	
	//자유게시판 상세보기 클릭시 조회수 증가
		public int updateCount(Connection con, int nno) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("FreeBoardUpdateCount");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, nno);
				pstmt.setInt(2, nno);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			
			return result;
		}
	
	//자유게시판 수정
	public int updateFreeBoard(Connection con, FreeBoard f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFreeBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getBoard_title());
			pstmt.setString(2, f.getBoard_content());
			pstmt.setInt(3, f.getBoard_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//자유게시판 검색
	public ArrayList<FreeBoard> searchFreeBoard(Connection con, String search, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FreeBoard> list = null;
		FreeBoard f = null;
		
		String query = prop.getProperty("searchFreeBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			list = new ArrayList<FreeBoard>();
			
			while(rset.next()){
				f = new FreeBoard();
				f.setRownum(rset.getInt(1));
				f.setBoard_no(rset.getInt("board_no"));
				f.setBoard_type(rset.getInt("board_type"));
				f.setBoard_title(rset.getString("board_title"));
				f.setBoard_content(rset.getString("board_content"));
				f.setBoard_date(rset.getDate("board_date"));
				f.setMember_no(rset.getInt("member_no"));
				//n.setModifyDate(rset.getDate("modify_date"));
				f.setBoard_status(rset.getInt("board_status"));
				f.setBoard_count(rset.getInt("board_count"));
				f.setMain_view(rset.getInt("main_view"));
				f.setNick_name(rset.getString("nick_name"));
				
				list.add(f);
				
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//자유게시판 삭제
	public int delFreeBoard(Connection con, int board_no) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("deleteFreeBoard");
	
	try {
		pstmt=con.prepareStatement(query);
		pstmt.setInt(1, board_no);
		
		result=pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		close(pstmt);
	}
		
		return result;
	}

	//검색시 페이징
	public int getListCount(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCountSearch");
		
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			
			rset= pstmt.executeQuery();
			
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
