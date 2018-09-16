package com.comvision.artBridge.admin.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.admin.model.vo.Main;
import com.comvision.artBridge.admin.model.vo.Notice;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao(){
		String fileName = NoticeDao.class.getResource("/sql/admin/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	public Main selectMain(Connection con, Main mno) {
		Statement stmt = null;
		ResultSet rset = null;
		Main m = null;
		
		String qurey = prop.getProperty("selectAddMain");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(qurey);
			
			if(rset.next()){
				m.setBoard_no(rset.getInt("board_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
			
		
		/*try {
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
				
				list.add(n);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}*/
		
		
		return m;
	}


}
