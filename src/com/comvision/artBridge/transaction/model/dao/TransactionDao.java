package com.comvision.artBridge.transaction.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		
	public ArrayList<Transaction> selectTransList(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Transaction> transList = new ArrayList<Transaction>();
		
		System.out.println("2. 트랜젝션 DAO야 오니?");
		
		String query = prop.getProperty("selectTransList");
		
		try {
			System.out.println("2-1. rset만들자");
			pstmt = con.prepareStatement(query);
			
//			pstmt.setInt(1, mNo);
//			pstmt.setInt(2, mNo);
//			pstmt.setInt(3, mNo);
//			pstmt.setInt(4, mNo);
//			pstmt.setInt(5, mNo);
			
			pstmt.setInt(1, 11);
			pstmt.setInt(2, 11);
			pstmt.setInt(3, 11);
			pstmt.setInt(4, 11);
			pstmt.setInt(5, 11);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Transaction t = new Transaction();
				
				t.setBoard_title(rset.getString("board_title"));
				t.setDivRole_no(rset.getInt("divRole_no"));
				t.setOrders_no(rset.getInt("orders_no"));
				t.setCusName(rset.getString("cus_name"));
				t.setCusId(rset.getString("cus_id"));
				t.setWrtNick(rset.getString("wrt_nick"));
				t.setWrtId(rset.getString("WRT_ID"));
				t.setO_date(rset.getDate("o_start_date"));

				t.setO_final_date(rset.getDate("o_final_date"));
				
				t.setOd_startDate(rset.getDate("od_start_date"));
				t.setOd_endDate(rset.getDate("od_end_date"));		
				t.setBoard_no(rset.getInt("board_no"));
				t.setOrders_activity(rset.getInt("orders_activity"));
				
				//쿼리에 아직 처리 안 돼있음
//				t.setPay_status(rset.getInt("pay_status"));
//				t.setPayment(rset.getInt("payment"));	
				
				transList.add(t);
				System.out.println("3. 저장할 트랜객체야 : " + t);
				System.out.println("3. 생성된 트랜스리스트야 : " + transList);

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
		
		String query = prop.getProperty("selectTransStmt");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			pstmt.setInt(3, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				t = new Transaction();
				t.setOrders_no(rset.getInt("orders_no"));
				t.setO_date(rset.getDate("o_start_date"));
				t.setCusName(rset.getString("cusnick"));
				t.setWrtNick(rset.getString("wrinick"));
				t.setBoard_title(rset.getString("board_title"));
				t.setWrtNo(rset.getInt("writer_no"));
				t.setCusNo(rset.getInt("member_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return t;
	}

	public int updateOdEndDate(Connection con, int oNo, int actNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("dao야 오니?");
		System.out.println(oNo + ", " + actNo);
//		UPDATE ORDERS_DETAIL SET OD_END_DATE = SYSDATE WHERE ORDERS_NO = ? AND ORDERS_ACTIVITY = ?;
		String query = prop.getProperty("updateOdEndDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, oNo);
			pstmt.setInt(2, actNo);
			
			result = pstmt.executeUpdate();
			System.out.println("업데이트 결과야 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertOdActNo(Connection con, int oNo, int actNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("dao야 오니?");
		System.out.println(oNo + ", " + actNo);
//		INSERT INTO ORDERS_DETAIL VALUES(SEQ_ORDERS_DETAIL_NO.nextval, (oNo), (actNo + 1), SYSDATE, NULL);
		String query = prop.getProperty("insertOdActNo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, oNo);
			pstmt.setInt(2, actNo + 1);
			
			result = pstmt.executeUpdate();
			System.out.println("업데이트 결과야 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
				
		return result;
	}

	public int updateO_finalDate(Connection con, int oNo, int actNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("dao야 오니?");
		System.out.println(oNo + ", " + actNo);
//		UPDATE ORDERS SET O_FINAL_DATE = SYSDATE WHERE ORDERS_NO = ?;
		String query = prop.getProperty("updateOdFinDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, oNo);
			
			result = pstmt.executeUpdate();
			System.out.println("업데이트 결과야 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;		
	}
	

	public int insertProvideCommission(Connection con, int mNo, int oNo) {
		PreparedStatement pstmt = null;
		int result = 0;

//		INSERT INTO PROVIDE VALUES (SEQ_PROVIDE_NO.NEXTVAL, mNo, oNo, mNo, SYSDATE);
		String query = prop.getProperty("insertProvideCommission");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, oNo);
			pstmt.setInt(3, mNo);
			
			result = pstmt.executeUpdate();
			System.out.println("업데이트 결과야 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
				
		return result;
	}

	public int updatePayStatusComplete(Connection con, int oNo) {
		PreparedStatement pstmt = null;
		int result = 0;

//		update payment_detail set pay_status = 4 where payment_no = (select payment_no from payment where orders_no = ?);
		String query = prop.getProperty("updatePayComplete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, oNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	
}
