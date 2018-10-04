package com.comvision.artBridge.admin.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.AdminDao;
import com.comvision.artBridge.admin.model.vo.Rating;
import com.comvision.artBridge.admin.model.vo.Board;
import com.comvision.artBridge.admin.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.admin.model.vo.Relate;
import com.comvision.artBridge.admin.model.vo.Transaction;

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
	public int insertRelate(String relate_name) {
		Connection con = getConnection();
		
		int result = new AdminDao().insertRelate(con, relate_name);
		
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

	public int updateMainDelete(String bno) {
		Connection con = getConnection();

		int b = new AdminDao().updateMainDelete(con, Integer.parseInt(bno));

		close(con);
		
		return b;
		
	}
		
	public int insertRating(ArrayList<Rating> insertList) {
		Connection con = getConnection();
		int result = 0;
		
		for(Rating r : insertList){
			result += new AdminDao().insertRating(con, r);
		}

		if(result == insertList.size()){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateRating(Rating r) {
		Connection con = getConnection();
		
		int result = 0;
		
		result = new AdminDao().updateRating(con, r);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
		//거래내역 관리 전체 출력
	public ArrayList<Transaction> selectTrs(int currentPage, int limit, String addQuery) {
		Connection con = getConnection();
		
		ArrayList<Transaction> list = new AdminDao().selectTrs(con,currentPage, limit, addQuery);
		
		close(con);
		
		return list;
		
	}
	
	//회원관리
	public int getMemberListCount(String addQuery) {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getMemberListCount(con, addQuery);
		
		close(con);
		
		return listCount;
	}
	
	//회원관리
	public ArrayList<Member> selectMemberList(int currentPage, int limit, String addQuery) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectMemberList(con, currentPage, limit, addQuery);
		
		close(con);
		
		return list;
	}

	//커미션관리 판매글 삭제
	public int deleteCommission(String bno) {
		Connection con = getConnection();

		int b = new AdminDao().deleteCommission(con, Integer.parseInt(bno));

		close(con);
		
		return b;
	}

	public ArrayList<Board> selectCommissionView() {
		
		Connection con = getConnection();
		
		ArrayList<Board> blist = new AdminDao().selectCommissionView(con);
		
		close(con);
		return blist;
	}

/*	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new MessageDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}*/
	
	
	//transaction 서치
	public ArrayList<Transaction> searchTrs(int currentPage, int limit, String addQuery) {
		
		System.out.println("서비스 진입");
		Connection con = getConnection();
		
		ArrayList<Transaction> list = new AdminDao().searchTrs(con,currentPage, limit,addQuery);
		
		close(con);
		
		return list;
	}
	public int[] selectMemberCounts() {
		Connection con = getConnection();
		
		int[] memberCounts = new AdminDao().selectMemberCounts(con);
		
		close(con);

		return memberCounts;
	}

	public int[] selectOrderCounts(String[] times) {
		Connection con = getConnection();
		
		int[] orderCounts = new AdminDao().selectOrderCounts(con, times);
		
		close(con);
		
		return orderCounts;
	}

	//작가 신청 페이지
	public Member selectPostulat(int num) {
		Connection con = getConnection();
		
		Member m = new AdminDao().selectPostulat(con, num);
		
		close(con);
		
		return m;
		
	}
	//작가 신청 첨부파일 불러오기
	public ArrayList<Files> selectFilelist(int num) {
		Connection con = getConnection();
		
		ArrayList<Files> flist = new AdminDao().selectFilelist(con, num);
		
		close(con);
		return flist;
	}

	//작가 승인 버튼
	public int updateInsertPostulat(String approval_content, int member_no, int pos ) {
		Connection con = getConnection();
		int result = 0;
		int update = 0;
		int insert = 0;
		
		update = new AdminDao().updateInsertPostulat(con, approval_content, member_no, pos);
		if(pos == 1){
			insert = new AdminDao().insertPostulat(con, member_no, "작가신청이 승인되었습니다.");
		}else{
			insert = new AdminDao().insertPostulat(con, member_no, "작가신청이 거절되었습니다.");
		}
		
		if(update > 0 && insert > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		return result;
	}

	//saleListCount
	public int getSaleListCount(String addQuery) {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getSaleListCount(con, addQuery);
		
		close(con);
		
		return listCount;
	}

	//mainAdmin-saleList
	public ArrayList<Board> selectSaleList(int currentPage, int limit, String addQuery) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectSaleList(con, currentPage, limit, addQuery);
		
		close(con);
		
		return list;
	}

	//boardListCount
	public int getSaleListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getSaleListCount(con);
		
		close(con);
		
		return listCount;
	}

	//commissionAdmin-boardList
	public ArrayList<Board> selectBoardList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectBoardList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<Board> selectBoardList(int currentPage, int limit, String addQuery) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new AdminDao().selectSaleList(con, currentPage, limit, addQuery);
		
		close(con);

		return list;
	}

	public int getTrsListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getTrsListCount(con);
		
		close(con);
		
		return listCount;
	}


}
