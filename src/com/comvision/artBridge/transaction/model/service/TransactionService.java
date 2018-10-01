package com.comvision.artBridge.transaction.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.transaction.model.dao.TransactionDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class TransactionService {
	
	/*수정한 메소드 아래에 작성 됨  ->  추후 수정, 통합 예정 */
	public ArrayList<Transaction> selectTransList(int mNo){
		Connection con = getConnection();

			
		// orders_detail 테이블 생성 -> 포함
		ArrayList<Transaction> afterSubList = new TransactionDao().selectAfterSubList(con, mNo);		
		
//		if(beforeSubList.get())      만약 od_start_date같은 orders_ditail 테이블 항목이 생성 전인지 후인지를 비교해서 리스트 출력
		
		close(con);
		
		return afterSubList;
	}
	
	public ArrayList<Transaction> selectTransList2(int mNo){
		Connection con = getConnection();
		
		System.out.println("1. 트랜젝션 서비스야 오니?");
		
		// orders_detail 테이블 생성 -> 포함   쿼리 완료*********
		ArrayList<Transaction> transList = new TransactionDao().selectTransList2(con, mNo);
		
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

}
