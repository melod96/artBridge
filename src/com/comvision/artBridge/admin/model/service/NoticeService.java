package com.comvision.artBridge.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Notice;
import static com.comvision.artBridge.common.JDBCTemplate.*;

public class NoticeService {
	
	//공지사항 등록용 메소드
	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//공지사항 리스트 출력용 메소드
	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
	}
	
	//공지사항 상세보기용 메소드
	public Notice selectOne(String num) {
		Connection con = getConnection();
		
		Notice n = new NoticeDao().selectOne(con, num);
		
		if(n != null){
			int result = new NoticeDao().updateCount(con, n.getnNo());
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			close(con);
		}
		
		return n;
	}

	//페이징 처리용 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//공지사항 수정용 메소드
	/*public Notice updateOne(String num) {
		Connection con = getConnection();
		
		Notice n = new NoticeDao().updateOne(con, num);
		
		if(n != null){
			int result = new NoticeDao().updateNotice(con, num);
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			close(con);
		}
		
		return n;
	}*/
	

}
