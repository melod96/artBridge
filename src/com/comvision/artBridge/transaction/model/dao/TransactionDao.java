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
	
	/*수정한 메소드 아래에 작성 됨  ->  추후 수정, 통합 예정 */
	public ArrayList<Transaction> selectAfterSubList(Connection con, int mNo) {		/*수정한 메소드 아래에 작성 됨*/
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
		
	public ArrayList<Transaction> selectTransList2(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Transaction> transList = new ArrayList<Transaction>();
		
		System.out.println("2. 트랜젝션 DAO야 오니?");
		
		String query = prop.getProperty("selectTransList");
		
		try {
			System.out.println("2-1. rset만들자");
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 11);
			pstmt.setInt(2, 11);
			pstmt.setInt(3, 11);
			
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

	public int confirmRequest(Connection con, int oNo, int actNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
//		UPDATE ORDERS_DETAIL SET OD_END_DATE = SYSDATE WHERE ORDERS_NO = ? AND ORDERS_ACTIVITY = ?;
		String query = prop.getProperty("updateOdEndDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 5);
			pstmt.setInt(2, 4);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	
}
