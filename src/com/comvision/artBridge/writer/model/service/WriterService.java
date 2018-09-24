package com.comvision.artBridge.writer.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.writer.model.dao.WriterDao;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class WriterService {

	//작가 작품관리 리스트 출력
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new WriterDao().selectList(con, currentPage, limit);

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
	public int insertPiece(Board b, ArrayList<Files> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new WriterDao().insertPiece(con, b);
		int result2 = new WriterDao().insertAttachment(con, fileList);
		
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
	public ArrayList<Board> deletePiece(int pieceNo, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = null;
		int result = 0;
		
		if(result > 0){
			commit(con);
			list = new WriterDao().selectList(con, currentPage, limit);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	

}
