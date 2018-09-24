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

	public ArrayList<Message> selectList(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> list = null;
		
		String query = prop.getProperty("selectList");
		System.out.println("dao실행1");
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Message>();
			System.out.println("dao실행2");
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
			close(pstmt);
			close(rset);
		}
		
		
		return list;
		
	}

}
