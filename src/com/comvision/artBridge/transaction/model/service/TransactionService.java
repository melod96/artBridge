package com.comvision.artBridge.transaction.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.transaction.model.dao.TransactionDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class TransactionService {
	
	public ArrayList<Transaction> selectTransList(int mNo){
		Connection con = getConnection();
		
		ArrayList<Transaction> transList = new TransactionDao().selectTransList(con, mNo);		
		
		close(con);
		
		return transList;
	}

	public Transaction selectTransOne(int mNo, int orderNo) {
		Connection con = getConnection();
		
		Transaction t = new TransactionDao().selectTransOne(con, mNo, orderNo);		
		
		close(con);
		
		return t;
	}

}
