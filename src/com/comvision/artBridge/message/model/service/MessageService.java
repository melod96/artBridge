package com.comvision.artBridge.message.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

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

	public ArrayList<Message> SelectList(int currentPage, int limit, String addQuery) {
		System.out.println("서비스 진입");
		Connection con = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectList(con,currentPage, limit,addQuery);
		
		close(con);
		
		return list;
		
		
		
		
	}

	public Message SelectOneMSG(int msg_no) {
		
		Connection con = getConnection();
		
		Message m = new MessageDao().SelectOneMSG(con, msg_no);
		
			if(m != null){
				commit(con);
			}else{
				rollback(con);
			}
			close(con);
		
		
		return m;
		
	}

	public int updateMSG(String msgNo, String option) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().updateMSG(con, msgNo, option);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertMSGTo(String title, String content, String msgNo) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().insertMSGTo(con, title, content, msgNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

}
