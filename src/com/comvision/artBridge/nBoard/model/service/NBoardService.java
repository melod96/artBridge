package com.comvision.artBridge.nBoard.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.nBoard.model.dao.NBoardDao;


public class NBoardService {
	
	

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NBoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NBoardDao().selectList(con,currentPage, limit);
		
		close(con);
		
		return list;	
		
	}

	public Notice selectOne(String num) {
		
		
		Connection con = getConnection();
		
		Notice n = new NBoardDao().selectOne(con, num);
		
		if(n != null){
			int result = new NBoardDao().updateCount(con, n.getnNo());
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			close(con);
		}
		
		return n;
	}

	public ArrayList<Notice> searchNotice(int currentPage, int limit, String search) {
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NBoardDao().searchNotice(currentPage, limit,con, search);
		
		close(con);
		
		return list;
		
	}

	public int getSearchListCount(String search) {
		
		Connection con = getConnection();
		
		int listCount = new NBoardDao().getSearchListCount(con, search);
		
		close(con);
		
		return listCount;
		
	}

}
