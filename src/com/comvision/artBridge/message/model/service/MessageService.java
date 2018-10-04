package com.comvision.artBridge.message.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.message.model.dao.MessageDao;
import com.comvision.artBridge.message.model.vo.Message;
import com.comvision.artBridge.transaction.model.dao.TransactionDao;
import com.comvision.artBridge.transaction.model.vo.Transaction;


public class MessageService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new MessageDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Message> SelectList(int currentPage, int limit, String addQuery) {
		
		
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

	public int insertMSGTo(String title, String content, String mem_no) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().insertMSGTo(con, title, content, mem_no);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

	public ArrayList<Message> mySelectList(int currentPage, int limit, String addQuery, int memberNo) {
		
		Connection con = getConnection();
		
		ArrayList<Message> list = new MessageDao().myselectList(con,currentPage, limit,addQuery,memberNo);
		
		close(con);
		
		return list;
		
	}

	public int getMyListCount(String addQuery) {
		
		Connection con = getConnection();
		
		int listCount = new MessageDao().getMyListCount(con, addQuery);
		
		close(con);
		
		return listCount;
		
	}

	public int sendMSG(String mem_id, String receive_mem_no, String title, String editor) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().sendMSG(con, mem_id, receive_mem_no, title, editor);
		
		close(con);
		
		return result;
		
	}

	public int insertMyMSGTo(String title, String content, String dispatch_member_no, String mem_id) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().insertMyMSGTo(con, title, content,dispatch_member_no, mem_id);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
		
		
	}

	public ArrayList<Message> selectMyMsgList(int mNo) {
		Connection con = getConnection();

		ArrayList<Message> msgList = new MessageDao().selectMyMsgList(con, mNo);
		
		close(con);
		
		return msgList;
	}
	

	public ArrayList<Message> SelectmCount(int currentPage, int limit, String addQuery) {
		

		Connection con = getConnection();
		
		ArrayList<Message> list = new MessageDao().SelectmCount(con,currentPage, limit,addQuery);
		
		close(con);
		
		return list;
		
		
	}
	public int sendMyMsg(int mNo, String receiverNo, String title, String editor) {
		Connection con = getConnection();
		
		int result = 0;
		
//		INSERT INTO MESSAGE VALUES(SEQ_MESSAGE_NO, TITLE, EDITOR, SYSDATE, MNO, RECEIVERNO, NULL);
		
		result = new MessageDao().sendMyMsg(con, mNo, receiverNo, title, editor);
		
		System.out.println("��� �?" + result);
		
		if(result > 0){
			System.out.println("�μ�Ʈ �����߾�");
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	

}
