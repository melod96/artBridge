package com.comvision.artBridge.member.model.dao;

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

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao(){
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public Member loginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setString(3, userId);
			pstmt.setString(4, userPwd);

			rset = pstmt.executeQuery();
			
			if(rset.next()){
				loginUser = new Member();
				
				loginUser.setMember_no(rset.getInt("member_no"));
				loginUser.setId(rset.getString("id"));
				loginUser.setPassword(rset.getString("password"));
				loginUser.setName(rset.getString("name"));
				loginUser.setAdmin_right(rset.getInt("admin_right"));
				loginUser.setToken(rset.getString("token"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setNick_name(rset.getString("nick_name"));
				loginUser.setEnroll_date(rset.getDate("enroll_date"));
				loginUser.setRogin_date(rset.getDate("rogin_date"));
				loginUser.setWriter_right(rset.getInt("writer_right"));
				loginUser.setIntroduction(rset.getString("introduction"));
				loginUser.setBank(rset.getString("bank"));
				loginUser.setAccount(rset.getString("account"));
				loginUser.setWriter_date(rset.getDate("writer_date"));
				loginUser.setReception_status(rset.getInt("reception_status"));
				loginUser.setWriter_slot(rset.getInt("writer_slot"));
				loginUser.setRating_no(rset.getInt("rating_no"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getNick_name());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectMemberCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectMemberCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				result = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	public int insertMemberStatus(Connection con, int currval) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMemberStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int nickNameCheck(Connection con, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickNameCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nickName);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int pwdCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("pwdCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
//			System.out.println(userPwd + ", " + userId);
			
			if(rset.next()){
				result = result + 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int updateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		//update member set password=?, nick_name=?, phone=?, email=? where id=?
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getNick_name());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<String> findId(Connection con, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> idList = null;
		
		String query = prop.getProperty("findId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			rset = pstmt.executeQuery();
			
			idList = new ArrayList<String>();
			
			while(rset.next()){
				idList.add(rset.getString("id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return idList;
	}

	public int findPassword(Connection con, String id, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int member_no = 0;
		
		String query = prop.getProperty("findPassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.setString(5, name);
			pstmt.setString(6, email);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				member_no = rset.getInt("member_no");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return member_no;
	}

	public int changePassword(Connection con, int member_no, String password) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changePassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, password);
			pstmt.setInt(2, member_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int deleteMemberRequest(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMemberRequest");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int deleteAbleCheck(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAbleCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}


}
