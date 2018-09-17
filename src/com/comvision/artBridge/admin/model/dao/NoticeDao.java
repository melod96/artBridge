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

import com.comvision.artBridge.admin.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao(){
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//공지사항 등록용 메소드
	public int insertNotice(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//공지사항 리스트 출력용 메소드
	public ArrayList<Notice> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String qurey = prop.getProperty("selectNoticeList2");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(qurey);
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				Notice n = new Notice();
				n.setRownum(rset.getInt(1));
				n.setnNo(rset.getInt("board_no"));
				n.setnType(rset.getInt("board_type"));
				n.setnTitle(rset.getString("board_title"));
				n.setnContent(rset.getString("board_content"));
				n.setnDate(rset.getDate("board_date"));
				n.setMemberNo(rset.getInt("member_no"));
				n.setModifyDate(rset.getDate("modify_date"));
				n.setnStatus(rset.getInt("board_status"));
				n.setnCount(rset.getInt("board_count"));
				n.setMain_view(rset.getInt("main_view"));
				
				list.add(n);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	//공지사항 상세보기용 메소드
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
				n.setMemberNo(rset.getInt("member_no"));
				n.setModifyDate(rset.getDate("modify_date"));
				n.setnStatus(rset.getInt("board_status"));
				n.setnCount(rset.getInt("board_count"));
				n.setMain_view(rset.getInt("main_view"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	//공지사항 상세보기 클릭시 조회수 증가
	public int updateCount(Connection con, int nno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("noticeUpdateCount");
		
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

	//페이징 처리용 메소드
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

	//공지사항 수정용 메소드
	/*public int updateNotice(Connection con, String num) {
		PreparedStatement pstmt = null;
		int result = 0;
		Notice n = null;
		
		String query = prop.getProperty("updateNotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}*/

	
}
