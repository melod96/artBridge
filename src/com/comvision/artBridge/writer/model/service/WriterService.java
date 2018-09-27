package com.comvision.artBridge.writer.model.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.sale.model.vo.Options;
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
	public int getListCount(int memberNo) {
		Connection con = getConnection();
		
		int listCount = new WriterDao().getListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}

	//작가 작품등록 메소드
	public int insertPiece(Board b, ArrayList<Files> fileList, String[] relateCk, ArrayList<Options> optionsList) {
		Connection con = getConnection();
		int result = 0;  //제목 등 데이터 저장용
		int result2 = 0; //썸네일 파일 저장용
		int result3 = 0; //옵션 및 가격 저장용
		int result4 = 0; //연관검색어 저장용
		
		int result1 = new WriterDao().insertPiece(con, b);
		
		int currval = new WriterDao().selectBoardCurrval(con);
		
		for(int i = 0; i < fileList.size(); i++){
			result2 += new WriterDao().insertAttachment(con, fileList.get(i), currval, i + 2);
		}
		
		for(int i = 0; i < optionsList.size(); i++){
			result3 += new WriterDao().insertOptions(con, optionsList.get(i), currval);
		}
		
		for(int i = 0; i < relateCk.length; i++){
			result4 += new WriterDao().relateNumList(con, relateCk[i], currval);
		}
		
		if(result1 > 0 && result2 == fileList.size() && result3 == optionsList.size() && result4 == relateCk.length){
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

	//작품리스트 노출(썸네일 포함)
	public HashMap<String, Object> selectThumbImg(int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		hmap = new WriterDao().selectThumbImg(con, currentPage, limit, memberNo);
		
		if(hmap != null){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}

	//작가 별점 노출용 메소드
	public int selectWriterAvg(int memberNo) {
		Connection con = getConnection();
		
		int selectWriterAvg = 0;
		
		selectWriterAvg = new WriterDao().selectWriterAvg(con, memberNo);
		
		close(con);
		
		return selectWriterAvg;
	}
	

}
