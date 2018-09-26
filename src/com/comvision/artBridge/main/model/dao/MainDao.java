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


	public ArrayList<Files> selectProfileImg(Connection con) {
		
			ArrayList<Files> flist = null;
		 	PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("selectMain");
			
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

}
