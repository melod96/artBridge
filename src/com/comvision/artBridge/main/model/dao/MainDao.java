package com.comvision.artBridge.main.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.files.model.vo.Files;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao(){
		String fileName= MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public ArrayList<Files> mainLoad(Connection con) {
		
			ArrayList<Files> flist = null;
		 	PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("selectSlide");
			
			try {
				pstmt = con.prepareStatement(query);
				
				rset = pstmt.executeQuery();
				
				
				flist = new ArrayList<Files>();
				
				
				while(rset.next()){
					Files f = new Files();
					
					f.setFiles_no(rset.getInt("files_no"));
					f.setF_reference_no(rset.getInt("F_REFERENCE_NO"));
					f.setFiles_title(rset.getString("FILES_TITLE"));
					f.setChange_title(rset.getString("CHANGE_TITLE"));
					f.setFiles_type(rset.getInt("FILES_TYPE"));
					f.setFiles_root(rset.getString("FILES_ROOT"));
					f.setFiles_date(rset.getDate("FILES_DATE"));
					f.setFiles_secession(rset.getInt("FILES_SECESSION"));
					
					
					
					flist.add(f);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
			
			return flist;
		
		
	}


	public ArrayList<Files> mainLoad2(Connection con) {
		
		ArrayList<Files> flist = null;
	 	PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBestWriter");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			flist = new ArrayList<Files>();
			
			while(rset.next()){
				Files f = new Files();
				
				f.setFiles_no(rset.getInt("files_no"));
				f.setF_reference_no(rset.getInt("F_REFERENCE_NO"));
				f.setFiles_title(rset.getString("FILES_TITLE"));
				f.setChange_title(rset.getString("CHANGE_TITLE"));
				f.setFiles_type(rset.getInt("FILES_TYPE"));
				f.setFiles_root(rset.getString("FILES_ROOT"));
				f.setFiles_date(rset.getDate("FILES_DATE"));
				f.setFiles_secession(rset.getInt("FILES_SECESSION"));
				f.setMem_name(rset.getString("MEMBER_NO"));
				f.setMem_name(rset.getString("NAME"));
				
				//쿼리문에는 name 과 member_no까지 select하도록 되어있음. files 객체에 추가 하여 사용 가능.
				
				flist.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return flist;
	}


	public ArrayList<Files> mainLoad3(Connection con) {
		
		ArrayList<Files> flist = null;
	 	PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNewList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			flist = new ArrayList<Files>();
			
			while(rset.next()){
				Files f = new Files();
				
				f.setFiles_no(rset.getInt("files_no"));
				f.setF_reference_no(rset.getInt("F_REFERENCE_NO"));
				f.setFiles_title(rset.getString("FILES_TITLE"));
				f.setChange_title(rset.getString("CHANGE_TITLE"));
				f.setFiles_type(rset.getInt("FILES_TYPE"));
				f.setFiles_root(rset.getString("FILES_ROOT"));
				f.setFiles_date(rset.getDate("FILES_DATE"));
				f.setFiles_secession(rset.getInt("FILES_SECESSION"));
				f.setMem_name(rset.getString("MEMBER_NO"));
				f.setMem_name(rset.getString("NAME"));
				f.setBoard_title(rset.getString("BOARD_TITLE"));
				f.setBoard_no(rset.getInt("BOARD_NO"));
				
				flist.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return flist;
		
	}


	public ArrayList<Notice> searchNoticeList(Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> noticeList = null;
		
		String query = prop.getProperty("searchNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			noticeList = new ArrayList<Notice>();
			
			while(rset.next()){
				Notice n = new Notice();
				n.setRownum(rset.getInt(1));
				n.setnNo(rset.getInt("BOARD_NO"));
				n.setnType(rset.getInt("BOARD_TYPE"));
				n.setnTitle(rset.getString("BOARD_TITLE"));
				n.setnContent(rset.getString("BOARD_CONTENT"));
				n.setnDate(rset.getDate("BOARD_DATE"));
				n.setModifyDate(rset.getDate("MODIFY_DATE"));
				n.setnStatus(rset.getInt("BOARD_STATUS"));
				n.setnCount(rset.getInt("BOARD_COUNT"));
				
				noticeList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return noticeList;
	}

}
