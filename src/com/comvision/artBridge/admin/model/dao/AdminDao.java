package com.comvision.artBridge.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.board.model.vo.Board;



public class AdminDao {
	
private Properties prop = new Properties();
	
	public AdminDao(){
		String fileName= AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectSaleList(Connection con, int currentPage, int limit) {
		
		
		
		return null;
	}

}
