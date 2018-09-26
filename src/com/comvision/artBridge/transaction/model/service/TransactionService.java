package com.comvision.artBridge.transaction.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.transaction.model.dao.TransactionDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class TransactionService {
	
	public ArrayList<Transaction> selectTransList(int currentPage, int limit, int mNo){
		Connection con = getConnection();
		
		ArrayList<Transaction> transList = null;
		
		// orders_detail 테이블 미포함
		ArrayList<Transaction> beforeSubList = new TransactionDao().selectBeforeSubList(con, currentPage, limit, mNo);		
		// orders_detail 테이블 생성 -> 포함
		ArrayList<Transaction> afterSubList = new TransactionDao().selectAfterSubList(con, currentPage, limit, mNo);		
		
//		if(beforeSubList.get())      만약 od_start_date같은 orders_ditail 테이블 항목이 생성 전인지 후인지를 비교해서 리스트 출력
		
		
		close(con);
		
		return transList;
	}

	public Transaction selectTransOne(int mNo, int orderNo) {
		Connection con = getConnection();
		
		Transaction t = new TransactionDao().selectTransStmt(con, mNo, orderNo);		
		
		close(con);
		
		return t;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new TransactionDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

}
