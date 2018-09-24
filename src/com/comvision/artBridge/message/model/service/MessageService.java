package com.comvision.artBridge.message.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.message.model.dao.MessageDao;
import com.comvision.artBridge.message.model.vo.Message;


public class MessageService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new MessageDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Message> SelectList(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectList(con,currentPage, limit);
		
		close(con);
		
		return list;
		
		
		
		
	}

}
