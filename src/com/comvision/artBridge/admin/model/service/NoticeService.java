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
	//public ArrayList<Notice> selectList() {
	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		//ArrayList<Notice> list = new NoticeDao().selectList(con);
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	//페이징처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
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

	//공지사항 수정용 메소드
	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//공지사항 검색용 메소드
	public ArrayList<Notice> searchNotice(String search, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchNotice(con, search, currentPage, limit);
		
		System.out.println(list);//여기서 문제네??
		close(con);
		return list;
	}

	//공지사항 삭제용 메소드
	public ArrayList<Notice> delNotice(String[] contCheck, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = null;
		int result = 0;
		
		for(int i = 0; i < contCheck.length; i++){
			result += new NoticeDao().delNotice(con, contCheck[i]);
			System.out.println(result);
		}
		if(result == contCheck.length){
			commit(con);
			list = new NoticeDao().selectList(con, currentPage, limit);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	

}
