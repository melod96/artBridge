package com.comvision.artBridge.writer.model.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Notice;
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

	//페이징처리
	public int getListCount(int memberNo) {
		Connection con = getConnection();
		
		int listCount = new WriterDao().getListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}

	//작가 작품등록 메소드
	public int insertPiece(Board b, ArrayList<Files> fileList, String[] relateCk, ArrayList<Options> optionsList, int memberNo) {
		Connection con = getConnection();
		int result = 0;  
		int result1 = 0;//제목 등 데이터 저장용
		int result2 = 0; //썸네일 파일 저장용
		int result3 = 0; //옵션 및 가격 저장용
		int result4 = 0; //연관검색어 저장용
		
		result1 = new WriterDao().insertPiece(con, b);
		
		int currval = new WriterDao().selectBoardCurrval(con);
		
		for(int i = 0; i < fileList.size(); i++){
			result2 += new WriterDao().insertAttachment(con, fileList.get(i), currval, i + 2);
		}
		
		for(int i = 0; i < optionsList.size(); i++){
			result3 += new WriterDao().insertOptions(con, optionsList.get(i), currval, memberNo);
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
	public ArrayList<HashMap<String, Object>> deletePiece(int pieceNo, int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = null;
		int result = 0;
		
		int b = new WriterDao().deletePiece(con, pieceNo);

		if(b > 0){
			//list = new WriterDao().selectList(con, currentPage, limit, memberNo);
			list = new WriterDao().selectBoardWithThumbImg(con, currentPage, limit, memberNo);
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

	//작가 별점 노출용 메소드
	public int selectWriterAvg(int memberNo) {
		Connection con = getConnection();
		
		int selectWriterAvg = 0;
		
		selectWriterAvg = new WriterDao().selectWriterAvg(con, memberNo);
		
		close(con);
		
		return selectWriterAvg;
	}

	//진행중인 의뢰 갯수 노출
	public int OrderIngCount(int memberNo) {
		Connection con = getConnection();
		
		int OrderIngCount = 0;
		
		OrderIngCount = new WriterDao().OrderIngCount(con, memberNo);
		
		close(con);
		
		return OrderIngCount;
	}

	//작가 작품관리 리스트(썸네일 포함)
	public ArrayList<HashMap<String, Object>> selectBoardWithThumbImg(int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = null;
		
		list = new WriterDao().selectBoardWithThumbImg(con, currentPage, limit, memberNo);
		
		close(con);
		
		return list;
	}

	//작품 수정하기 폼 메소드(board데이터 + 썸네일)
	public HashMap<String, Object> selectPieceData(int memberNo, int pieceNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hamp = null;
		
		hamp = new WriterDao().selectPieceData(con, memberNo, pieceNo);

		close(con);
		
		return hamp;
	}
	
	//작품 수정하기 폼 메소드(옵션 가져오기)
	public ArrayList<Options> selectOptionsList(int memberNo, int pieceNo) {
		Connection con = getConnection();
		
		ArrayList<Options> optionsList = null;
		
		optionsList = new WriterDao().selectOptionsList(con, memberNo, pieceNo);
		
		close(con);
		
		return optionsList;
	}

	//작품 수정용 메소드
	public int updatePiece(Board b, ArrayList<Files> fileList, String[] relateCk, ArrayList<Options> optionsList, int memberNo) {
		Connection con = getConnection();
		int result = 0;  
		int result1 = 0; //제목 등 데이터 저장용
		int result2 = 0; //썸네일 파일 저장용
		int result3 = 0; //옵션 및 가격 저장용
		int result4 = 0; //연관검색어 저장용
		
		result1 = new WriterDao().updatePiece(con, b, memberNo);
		
		for(int i = 0; i < fileList.size(); i++){
			result2 += new WriterDao().updateAttachment(con, fileList.get(i), b.getBoard_no(), (i + 2));
		}
		
		new WriterDao().updateOptions(con, b.getBoard_no(), memberNo);
		for(int i = 0; i < optionsList.size(); i++){
			result3 += new WriterDao().insertOptions(con, optionsList.get(i), b.getBoard_no(), memberNo);
		}
		
		new WriterDao().updateRelate(con, b.getBoard_no());
		for(int i = 0; i < relateCk.length; i++){
			result4 += new WriterDao().relateNumList(con, relateCk[i], b.getBoard_no());
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

	public Member selectWriter(int memberNo) {
		Connection con = getConnection();
		
		Member m = null;
		
		m = new WriterDao().selectWriter(con, memberNo);

		close(con);
		
		return m;
	}

	

	
	
}
