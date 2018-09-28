package com.comvision.artBridge.message.model.dao;

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

import com.comvision.artBridge.message.model.vo.Message;


public class MessageDao {
	
	private Properties prop = new Properties();
	
	public MessageDao(){
		String fileName= MessageDao.class.getResource("/sql/message/message-query.properties").getPath();
		
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

	public ArrayList<Message> selectList(Connection con, int currentPage, int limit, String addQuery) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Message> list = null;
		
		String query = prop.getProperty("selectListTest");
		System.out.println("dao실행1");
		try {
			stmt = con.createStatement();
			
			query += " " + addQuery;
			
			query += ") ";
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			String rnumQuery = "where rnum between " + startRow + " and " + endRow ;
			
			query += rnumQuery;
			
			System.out.println("최종 실행되는 Query : " + query);
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Message>();
			
			
			while(rset.next()){
				Message m = new Message();
				m.setMsg_no(rset.getInt("MESSAGE_NO"));
				m.setMsg_title(rset.getString("MESSAGE_TITLE"));
				m.setMsg_content(rset.getString("MESSAGE_CONTENT"));
				m.setMsg_date(rset.getDate("MESSAGE_DATE"));
				m.setDispatch_member_no(rset.getInt("DISPATCH_MEMBER_NO"));
				m.setReceive_member_no(rset.getInt("RECEIVE_MEMBER_NO"));
				m.setCheck_date(rset.getDate("CHECK_DATE"));
				m.setMem_name(rset.getString("NAME"));
				m.setWriter_right(rset.getInt("WRITER_RIGHT"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		
		return list;
		
	}

	public Message SelectOneMSG(Connection con, int msg_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Message m = null;
		String query = prop.getProperty("selectMSGDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, msg_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Message();
				m.setMem_no(rset.getInt("member_no"));
				m.setMsg_no(rset.getInt("message_no"));
				m.setWriter_right(rset.getInt("WRITER_RIGHT"));
				m.setMem_name(rset.getString("name"));
				m.setMsg_content(rset.getString("MESSAGE_CONTENT"));
				m.setDispatch_member_no(rset.getInt("DISPATCH_MEMBER_NO"));
				m.setReceive_member_no(rset.getInt("RECEIVE_MEMBER_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
		
	}

	public int updateMSG(Connection con, String msgNo, String option) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMSGDetail");
		
		try {
			System.out.println("updateMsg 쿼리 : "+query);
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(msgNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

	public int insertMSGTo(Connection con, String title, String content, String mem_no) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMSGTo");
		
//		MESSAGE_TITLE, MESSAGE_CONTENT, RECEIVE_MEMBER_NO(MEMBER_NO)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(mem_no));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

	public ArrayList<Message> myselectList(Connection con, int currentPage, int limit, String addQuery, int memberNo) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Message> list = null;
		
		String query = prop.getProperty("selectmyList");
		
		try {
			stmt = con.createStatement();
			
			query += " " + addQuery;
			
			query += ") ";
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			String rnumQuery = "where rnum between " + startRow + " and " + endRow ;
			
			query += rnumQuery;
			
			System.out.println("1최종 실행되는 Query : " + query);
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Message>();
			
			
			while(rset.next()){
				Message m = new Message();
				m.setMsg_no(rset.getInt("MESSAGE_NO"));
				m.setMsg_title(rset.getString("MESSAGE_TITLE"));
				m.setMsg_content(rset.getString("MESSAGE_CONTENT"));
				m.setMsg_date(rset.getDate("MESSAGE_DATE"));
				m.setDispatch_member_no(rset.getInt("DISPATCH_MEMBER_NO"));
				m.setReceive_member_no(rset.getInt("RECEIVE_MEMBER_NO"));
				m.setCheck_date(rset.getDate("CHECK_DATE"));
				m.setMem_name(rset.getString("NAME"));
				m.setWriter_right(rset.getInt("WRITER_RIGHT"));
//				m.setReceive_member_name(rset.getString("RENAME"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		
		return list;
		
	}

	public int getMyListCount(Connection con, String addQuery) {
		
		Statement stmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("MyListCount");
		
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			
			query += " " + addQuery;
			
			
			System.out.println("최종 실행되는 Query2 : " + query);
			
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

	public int sendMSG(Connection con, String mem_id, String receive_mem_no, String title, String editor) {
		
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("sendMSG");
		
		try {
			pstmt = con.prepareStatement(query);
			//--MESSAGE_NO, MESSAGE_TITLE, MESSAGE_CONTENT, MESSAGE_DATE, DISPATCH_MEMBER_NO, RECEIVE_MEMBER_NO, CHECK_DATE
			// INSERT INTO MESSAGE VALUES (SEQ_MESSAGE_NO.NEXTVAL, ? ,? ,SYSDATE, ?, ?, NULL)
			
			pstmt.setString(1, title);
			pstmt.setString(2, editor);
			pstmt.setInt(3, Integer.parseInt(mem_id));
			pstmt.setInt(4, Integer.parseInt(receive_mem_no));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertMyMSGTo(Connection con, String title, String content, String dispatch_member_no, String mem_id) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMyMSGTo");
		
//		MESSAGE_TITLE, MESSAGE_CONTENT, RECEIVE_MEMBER_NO(MEMBER_NO)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(mem_id));
			pstmt.setInt(4, Integer.parseInt(dispatch_member_no));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}


}
