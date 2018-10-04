package com.comvision.artBridge.transaction.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.sale.model.dao.SaleDao;
import com.comvision.artBridge.transaction.model.dao.TransactionDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class TransactionService {
	
	public ArrayList<Transaction> selectTransList(int mNo){
		Connection con = getConnection();
		
		System.out.println("1. 트랜젝션 서비스야 오니?");
		
		// orders_detail 테이블 생성 -> 포함   쿼리 완료*********
		ArrayList<Transaction> transList = new TransactionDao().selectTransList(con, mNo);
		
		System.out.println("4. 다시 서비스로 왔니?");
		
		close(con);
		
		return transList;
	}

	public Transaction selectTransOne(int mNo, int orderNo) {
		Connection con = getConnection();
		
		Transaction t = new TransactionDao().selectTransStmt(con, mNo, orderNo);		
		
		close(con);
		
		return t;
	}

	public int updateOdEndDate(int mNo, int oNo, int actNo) {
		Connection con= getConnection();
		System.out.println("서비스야 오니?");
//		UPDATE ORDERS_DETAIL SET OD_END_DATE = SYSDATE WHERE ORDERS_NO = ? AND ORDERS_ACTIVITY = ?;
		
		int result = new TransactionDao().updateOdEndDate(con, oNo, actNo);

		if(result > 0){
			System.out.println("리스트 수정했어");
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int insertOdActNo(int mNo, int oNo, int actNo) {
		Connection con = getConnection();
		
		int result = 0;

		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		// INSERT INTO ORDERS_DETAIL VALUES(SEQ_ORDERS_DETAIL_NO.nextval, (oNo), (actNo + 1), SYSDATE, NULL);
		if(actNo == 6){			
			result = new TransactionDao().updateOdEndDate(con, oNo, actNo);
			
			if(result > 0){
				result1 = new TransactionDao().updateO_finalDate(con, oNo, actNo);
				
				result2 = new TransactionDao().insertProvideCommission(con, mNo, oNo);
				result3 = new TransactionDao().updatePayStatusComplete(con, oNo);
			}
			
			result = result1 + result2 + result3;
			System.out.println("result : " + result1 + ", " + result2 + ", " + result3);
			if(result >= 3){
				result = 1;
			}else{
				result = 0;
			}
		}else {
			result = new TransactionDao().insertOdActNo(con, oNo, actNo);
		}
		
		System.out.println("결과 몇개?" + result);
		
		if(result > 0){
			System.out.println("인서트 성공했어");
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	

}
