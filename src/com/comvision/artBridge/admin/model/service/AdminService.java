package com.comvision.artBridge.admin.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.AdminDao;
import com.comvision.artBridge.admin.model.vo.Rating;
import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.member.model.dao.MemberDao;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.transaction.model.vo.Transaction;

public class AdminService {

	//관리자 판매글 목록 조회(select)
	public ArrayList<Board> selectSaleList(int currentPage, int limit, String kind, String keyword) {
	Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectSaleList(con,currentPage, limit,kind,keyword);
		
		close(con);

		
		return list;
		
		
	}

	//관리자 메인 insert
	public int insertAdmin(Board b) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new AdminDao().insertMain(con, b);

		
		if(result1 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;

	}

	//연관검색어 추가
	public int insertRelate(Relate r) {
Connection con = getConnection();
		
		int result = new AdminDao().insertRelate(con, r);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//추가된 연관검색어 모두 출력
	public ArrayList<Relate> selectRelate() {
		
		Connection con = getConnection();
		
		ArrayList<Relate> list = new AdminDao().selectRelate(con);
		
		close(con);
		

		
		return list;

	}

	public int updateMainView(String bno) {
		Connection con = getConnection();
		
		int b = new AdminDao().updateMainView(con, Integer.parseInt(bno));
		
		close(con);
		
		return b;
	}

	public ArrayList<Board> selectMainView() {
		Connection con = getConnection();
		
		ArrayList<Board> blist = new AdminDao().selectMainView(con);
		
		close(con);
		return blist;
	}
	
	//게시글 전체 출력
	public ArrayList<Board> selectBoard(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSaleList(con,currentPage, limit);
		
		close(con);
		
		return list;
	/*Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectBoard(con);
		
		close(con);
		
		return list;*/
	}
	
	//게시글 선택 출력
	
	
	public ArrayList<Board> selectBoardList(int currentPage, int limit, String kind, String keyword) {
		Connection con = getConnection();
			
		ArrayList<Board> list = new AdminDao().selectBoardList(con,currentPage, limit,kind,keyword);
		
		close(con);

		return list;

}

	public ArrayList<Rating> selectRating() {
		Connection con = getConnection();
		
		ArrayList<Rating> list = new AdminDao().selectRatingList(con);
		
		close(con);
		
		return list;
	}
	

	//거래내역 관리 전체 출력
	public ArrayList<Transaction> selectTrs(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Transaction> list = new AdminDao().selectTrs(con,currentPage, limit);
		
		close(con);
		
		return list;
		
	}
	
}
