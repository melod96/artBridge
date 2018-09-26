package com.comvision.artBridge.transaction.model.dao;

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

	
	public ArrayList<Transaction> selectAfterSubList(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Transaction> transList = new ArrayList<Transaction>();
		
		String query = prop.getProperty("selectBeforeSubList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			pstmt.setInt(3, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Transaction t = new Transaction();
				
				t.setBoard_title(rset.getString("board_title"));
				t.setDivRole_no(rset.getInt("divRole_no"));
				t.setOrders_no(rset.getInt("orders_no"));
				t.setCusName(rset.getString("cus_name"));
				t.setCusId(rset.getString("cus_id"));
				t.setWrtNick(rset.getString("wrt_nick"));
				t.setWrtId(rset.getString("wrt_id"));
				t.setO_date(rset.getDate("o_date"));
				/*t.setPay_status(rset.getInt("pay_status"));
				t.setPayment(rset.getInt("payment"));	//쿼리에 아직 처리 안 돼있음
				t.setOd_startDate(rset.getDate("od_start_date"));
				t.setOd_endDate(rset.getDate("od_end_date"));	*/			
				
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
		
		//여기도 아직 미완성 ㅠㅠ
		
		return t;
	}
	
	public int getListCount(Connection con) {
		Statement stmt = null;
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
		} finally {
			close(stmt);
			close(rset);		
		}
		
		return listCount;
	}


}
