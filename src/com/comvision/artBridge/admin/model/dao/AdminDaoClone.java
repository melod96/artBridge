package com.comvision.artBridge.admin.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.member.model.vo.Member;
import static com.comvision.artBridge.common.JDBCTemplate.*;

public class AdminDaoClone {
	
	private Properties prop = new Properties();
	
	public AdminDaoClone(){
		
		String fileName = AdminDaoClone.class.getResource("/sql/admin/admin-queryClone.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("memberListCount");
		
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection con, int currentPage, int limit, String addQuery) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		Member m = null;
		
		String query = prop.getProperty("selectMemberList");
		
		try {
			stmt = con.createStatement();
			
			query += " " + addQuery;
			
			query += ") ";
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			String rnumQuery = "where rnum between " + startRow + " and " + endRow + " order by member_no desc";
			
			query += rnumQuery;
			
			System.out.println("최종 실행되는 Query : " + query);
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Member>();
			
			while(rset.next()){
				
				m = new Member();
				
				m.setMember_no(rset.getInt("member_no"));
				m.setId(rset.getString("id"));
				m.setName(rset.getString("name"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
				m.setEnroll_date(rset.getDate("enroll_date"));
				m.setWriter_right(rset.getInt("writer_right"));
				m.setRating_name(rset.getString("rating_name"));

				
				list.add(m);
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

}
