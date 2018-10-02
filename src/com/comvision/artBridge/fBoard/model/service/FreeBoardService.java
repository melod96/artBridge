package com.comvision.artBridge.fBoard.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.fBoard.model.dao.FreeBoardDao;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;

public class FreeBoardService {
	
	
	//자유게시판 등록용 메소드
		public int insertFreeBoard(FreeBoard f) {
			Connection con = getConnection();
			
			int result = new FreeBoardDao().insertFreeBoard(con, f);
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			
			close(con);
			
			return result;
		}

		//자유게시판 리스트 출력용 메소드
		//public ArrayList<Notice> selectList() {
		public ArrayList<FreeBoard> selectFreeList(int currentPage, int limit) {
			Connection con = getConnection();
			
			//ArrayList<Notice> list = new NoticeDao().selectList(con);
			ArrayList<FreeBoard> list = new FreeBoardDao().selectFreeList(con, currentPage, limit);
			
			close(con);
			
			return list;
		}

		//페이징처리
		public int getListCount() {
			Connection con = getConnection();
			
			int listCount = new FreeBoardDao().getListCount(con);
			
			close(con);
			
			return listCount;
		}
		
		//자유게시판 상세보기용 메소드
				public FreeBoard selectOne(String num) {
					Connection con = getConnection();
					
					FreeBoard f = new FreeBoardDao().selectFreeOne(con, num);
					
					if(f != null){
						int result = new NoticeDao().updateCount(con, f.getBoard_no());
						
						if(result > 0){
							commit(con);
						}else{
							rollback(con);
						}
						close(con);
					}
					
					return f;
				}

				//자유게시판 수정용 메소드
				public int updateFreeBoard(FreeBoard f) {
					Connection con = getConnection();
					
					int result = new FreeBoardDao().updateFreeBoard(con, f);
					
					if(result > 0){
						commit(con);
					}else{
						rollback(con);
					}
					
					close(con);
					
					return result;
				}
				
				//자유게시판 검색용 메소드
				public ArrayList<FreeBoard> searchFreeBoard(String search, int currentPage, int limit) {
					Connection con = getConnection();
					
					ArrayList<FreeBoard> list = new FreeBoardDao().searchFreeBoard(con, search, currentPage, limit);
					
					close(con);
					return list;
				}
				
/*				//자유게시판 삭제
				public ArrayList<FreeBoard> delFreeBoard(String[] contCheck, int currentPage, int limit) {
					Connection con = getConnection();
					ArrayList<FreeBoard> list = null;
					int result = 0;
					
					for(int i = 0; i < contCheck.length; i++){
						result += new NoticeDao().delNotice(con, contCheck[i]);
						System.out.println(result);
					}
					if(result == contCheck.length){
						commit(con);
						list = new FreeBoardDao().selectFreeList(con, currentPage, limit);
					}else{
						rollback(con);
					}
					
					close(con);
					
					return list;
				}*/
	
		
}
