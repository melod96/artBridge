package com.comvision.artBridge.fav.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.fav.model.vo.Fav;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.transaction.model.dao.TransactionDao;

public class FavDao {
	private Properties prop = new Properties();
	
	public FavDao(){
		String fileName= TransactionDao.class.getResource("/sql/fav/fav-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Fav> selectFavlist(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Fav> flist = null;
		Fav f = null;
		
		String query = prop.getProperty("selectFavlist");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			flist = new ArrayList<Fav>();
			while(rset.next()){
				f = new Fav();
				f.setFav_no(rset.getInt("fav_no"));
				f.setMember_no(rset.getInt("member_no"));
				f.setWriter_no(rset.getInt("writer_no"));
				
				flist.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return flist;
	}

	public Member selectWriterinfo(Connection con, int writer_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("selectWriterinfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, writer_no);
			
			rset= pstmt.executeQuery();
			
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return loginUser;
	}

	public int wriSaleBoardCount(Connection con, int writer_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("wriSaleBoardCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, writer_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int selectWriGrade(Connection con, int writer_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectWriGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, writer_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt("avg(grade)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int wriOrderCount(Connection con, int writer_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("wriOrderCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, writer_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public Files selectProfile(Connection con, int writer_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Files f= null;
		
		String query = prop.getProperty("selectProfile");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, writer_no);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				f= new Files();
				f.setF_reference_no(rset.getInt("F_REFERENCE_NO"));
				f.setFiles_root(rset.getString("files_root"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}

}
