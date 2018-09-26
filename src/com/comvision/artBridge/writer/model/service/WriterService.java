package com.comvision.artBridge.writer.model.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.writer.model.dao.WriterDao;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class WriterService {

	//작가 작품관리 리스트 출력
	public ArrayList<Board> selectList(int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new WriterDao().selectList(con, currentPage, limit, memberNo);

		close(con);
		
		return list;
	}

	//페이징처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new WriterDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//작가 작품등록 메소드
	public int insertPiece(Board b, ArrayList<Files> fileList, String[] relateCk) {
		Connection con = getConnection();
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		
		int result1 = new WriterDao().insertPiece(con, b);
		//Board boardNo = new WriterDao().boardNoCk(con,b);
		//System.out.println("되니?" + boardNo.getBoard_no());
		
		int currval = new WriterDao().selectBoardCurrval(con);
		
		for(int i = 0; i < relateCk.length; i++){
			result3 += new WriterDao().relateNumList(con, relateCk[i], currval);
			System.out.println("연관검색어 되나?:" + result3);
		}
		
		for(int i = 0; i < fileList.size(); i++){
			result2 += new WriterDao().insertAttachment(con, fileList.get(i), currval, i + 2);
		}
		
		
		/*int result2 = new WriterDao().insertAttachment(con, fileList, currval);*/
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//연관검색어 노출용 메소드
	public ArrayList<Relate> relateWord() {
		Connection con = getConnection();
		
		ArrayList<Relate> relate = new WriterDao().relateWord(con);

		close(con);
		
		return relate;
	}

	//커미션 삭제용 메소드
	public ArrayList<Board> deletePiece(int pieceNo, int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		ArrayList<Board> list = null;
		int result = 0;
		
		int b = new WriterDao().deletePiece(con, pieceNo);

		if(b > 0){
			list = new WriterDao().selectList(con, currentPage, limit, memberNo);
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return list;
	}

	//프로필 저장용 메소드
	public int updateProfile(Member m, ArrayList<Files> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new WriterDao().updateProfile(con, m);
		if(fileList != null){
			int result2 = new WriterDao().updateProfileImg(con, fileList ,m);
		}

		if(result1 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//프로필 사진 노출용 메소드
	public ArrayList<Files> selectProfileImg(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<Files> selectProfileImg = null;
		
		selectProfileImg = new WriterDao().selectProfileImg(con, memberNo);
		
		close(con);
		
		return selectProfileImg;
	}
	

}
