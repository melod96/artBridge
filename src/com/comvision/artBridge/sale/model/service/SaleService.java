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

	//해당하는 판매글의 이미지 조회
	
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

	//명세표 보내기
	public int insertRequirements(String[] rsplit, int member_no, int board_no, int writer_no) {
		Connection con = getConnection();
		int result = 0;
		
		int order = new SaleDao().insertOrder(con, member_no, board_no, writer_no);
		int currval = new SaleDao().selectOrderCurrval(con);
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

/*	public HashMap<String, Object> selectFile(ArrayList<Board> list) {
		Connection con = getConnection();
		
		HashMap<String, Object> alist = new SaleDao().selectFileList(con, list);
		
		close(con);
		
		return alist;
	}*/

	public ArrayList<HashMap<String, Object>> selectFileAllList(int board_no) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> alist = new SaleDao().selectFileAllList(con, board_no);
		
		close(con);
		
		return alist;
	}

	public ArrayList<Files> selectFileList(int num) {
		Connection con = getConnection();
		
		ArrayList<Files> alist = new SaleDao().selectFileList(con, num);
		
		close(con);
		
		return alist;
	}

	public Files selectProfile(int num) {
		Connection con = getConnection();
		
		Files f = new SaleDao().selectProfile(con, num);
		
		close(con);
		
		return f;
	}

	




	

}
