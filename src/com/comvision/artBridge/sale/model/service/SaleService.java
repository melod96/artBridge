package com.comvision.artBridge.sale.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.member.model.dao.MemberDao;
import com.comvision.artBridge.member.model.vo.Rating;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.sale.model.dao.SaleDao;
import com.comvision.artBridge.sale.model.vo.Options;
import com.comvision.artBridge.sale.model.vo.Requirements;

public class SaleService {

	//해당 판매글의 옵션
	public ArrayList<HashMap<String, Object>> selectOptionList(int board_no) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> oplist = new SaleDao().selectOptionList(con, board_no);
		
		close(con);
		
		return oplist;
	}

	//해당하는 판매글 조회
	public Board selectBoardOneSalepage(int num) {
		Connection con = getConnection();
		Board b= null;
		
		int result = new BoardDao().updateCount(con,num);
		if(result>0){
			commit(con);
			b = new SaleDao().selectBoardOneSalepage(con,num);
		}else{
			rollback(con);
		}
		
		return b;
	}
	
	//해당하는 판매글의 연관검색어
	public ArrayList<Relate> selectRelateList(int num) {
		Connection con = getConnection();
		
		ArrayList<Relate> rlist = new SaleDao().selectRelateList(con,num);
		
		close(con);
		
		return rlist;
	}

	//해당하는 작가 등급
	public Rating selectRating(int num) {
		Connection con = getConnection();
		
		Rating r = new SaleDao().selectRating(con, num);
		
		close(con);
		
		return r;
	}

	//해당하는 판매글의 후기
	public ArrayList<Grade> selectGradeList(int num) {
		Connection con = getConnection();
		
		ArrayList<Grade> glist = new SaleDao().selectGradeList(con, num);
		close(con);
		
		return glist;
	}
	
	//후기 등록
	public int insertGrade(String content, int board_no, int member_no, int grade) {
		Connection con= getConnection();
		
		int result = new SaleDao().insertGrade(con, content, board_no, member_no,grade);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	//평균 별점
	public Grade avgGrade(int num) {
		Connection con = getConnection();
		
		Grade avgGrade = new SaleDao().avgGrade(con,num);
		
		if(avgGrade !=null){
			commit(con);
		}else{
			rollback(con);
		}
		return avgGrade;
	}
	
	//작가지정 슬롯수
	public int selectSlot(int member_no) {
		Connection con = getConnection();
		
		int slot = new SaleDao().selectSlot(con,member_no);
		close(con);
		return slot;
	}
	//작가 주문수
	public int selectOrderCount(int member_no) {
		Connection con = getConnection();
		
		int orderCount = new SaleDao().selectOrderCount(con, member_no);
		
		close(con);
		return orderCount;
	}

	//명세표 보내기
	public int insertRequirements(String[] rsplit, int member_no, int board_no, int writer_no, String option, int price) {
		Connection con = getConnection();
		int result = 0;
		
		int order = new SaleDao().insertOrder(con, member_no, board_no, writer_no);
		int currval = new SaleDao().selectOrderCurrval(con);
		int rootop = new SaleDao().insertRootOption(con,member_no,currval,option,price);
		for(int i = 0; i<rsplit.length; i++){
			int rinsert = new SaleDao().insertRequirements(con,member_no,currval ,rsplit[i]);			
		}
		int ord = new SaleDao().insertOrderDetail(con, currval);
		
		if(order>0&&currval>0&&ord>0){
			commit(con);
			result++;
		}else{
			rollback(con);
		}
		return result;
	}

	//판매페이지 썸네일 조회
	public ArrayList<HashMap<String, Object>> selectFileAllList(int board_no) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> alist = new SaleDao().selectFileAllList(con, board_no);
		
		close(con);
		
		return alist;
	}

	//해당하는 판매글의 이미지 조회
	public ArrayList<Files> selectFileList(int num) {
		Connection con = getConnection();
		
		ArrayList<Files> alist = new SaleDao().selectFileList(con, num);
		
		close(con);
		
		return alist;
	}

	//작가 프로필 사진
	public Files selectProfile(int num) {
		Connection con = getConnection();
		
		Files f = new SaleDao().selectProfile(con, num);
		
		close(con);
		
		return f;
	}

	//주문번호로 게시글 번호 받아오기
	public int selectBoard_no(int orders_no) {
		Connection con = getConnection();
		
		int result = new SaleDao().selectBoard_no(con,orders_no);
		
		close(con);
		return result;
	}

	public Board selectBoard(int board_no) {
		Connection con = getConnection();
		
		Board b = new SaleDao().selectBoard(con,board_no);
		
		close(con);
		return b;
	}

	//판매 요구사항 리스트
	public ArrayList<Requirements> selectsaleRequirementsList(int orders_no, int customer_no) {
		Connection con = getConnection();
		
		ArrayList<Requirements> olist = new SaleDao().selectsaleRequirementsList(con, orders_no,customer_no);
		
		close(con);
		return olist;

	}

	//결제 로직
	public int insertPayment(int customer_no, int orders_no, int totalPrice, String imp_uid, String apply_num) {
		Connection con = getConnection();
		
		int result = new SaleDao().insertPayment(con, customer_no, orders_no, totalPrice,imp_uid,apply_num);
		int currval = new SaleDao().selectPaymentCurrval(con);
		int detailresult = new SaleDao().insertPaymentDetail(con, currval);
		close(con);
		return result;
	}

	//총 가격
	public int totalPrice(int orderNoo, int mNo) {
		Connection con = getConnection();
		
		int price = new SaleDao().totalPrice(con, orderNoo, mNo);
		
		close(con);
		return price;
	}

	//요구사항 가격 업데이트
	public int updateprice(int orderno, int mNo, String price) {
		Connection con = getConnection();
		
		int update = new SaleDao().updateprice(con, orderno, mNo, price);
		
		close(con);
		return update;
	}

	//작가 코멘트 입력
	public int insertComment(int orderno, String comment) {
		Connection con = getConnection();
		
		int insert = new SaleDao().insertComment(con, orderno, comment);
		
		close(con);
		
		return insert;
	}

	

	

	




	

}
