package com.comvision.artBridge.transaction.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.message.model.dao.MessageDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class TransactionDao {
	private Properties prop = new Properties();
	
	public TransactionDao(){
		String fileName= TransactionDao.class.getResource("/sql/sale/sale-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Transaction> selectTransList(Connection con, int mNo) {
		
		
		return null;
	}

	public Transaction selectTransOne(Connection con, int mNo, int orderNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Transaction t = null;
		
		String query = prop.getProperty("");
		
		return null;
	}


}
