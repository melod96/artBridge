package com.comvision.artBridge.transaction.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Transaction> transList = new ArrayList<Transaction>();
		
		String query = prop.getProperty("selectMemberTransList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Transaction t = new Transaction();
				
				t.setDivRole_no(rset.getInt("divRole_no"));
				t.setOrders_no(rset.getInt("orders_no"));
				t.setCusName(rset.getString("cus_name"));
				t.setCusId(rset.getString("cus_id"));
				t.setWrtNick(rset.getString("wrt_nick"));
				t.setWrtId(rset.getString("wrt_id"));
				t.setO_date(rset.getDate("o_start_date"));
				t.setBoard_title(rset.getString("board_title"));
				
				transList.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return transList;
	}

	public Transaction selectTransStmt(Connection con, int mNo, int orderNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Transaction t = null;
		
		String query = prop.getProperty("");
		
		return null;
	}


}
