package com.comvision.artBridge.fav.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.fav.model.dao.FavDao;
import com.comvision.artBridge.fav.model.vo.Fav;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.sale.model.dao.SaleDao;

public class FavService {

	//관심 작가 출력
	public ArrayList<Fav> selectFavlist(int mNo) {
		Connection con = getConnection();
		
		ArrayList<Fav> flist = new FavDao().selectFavlist(con, mNo);
		
		close(con);
		
		return flist;
	}

	//관심작가 정보
	public Member selectWriterinfo(int writer_no) {
		Connection con = getConnection();
		
		Member m = new FavDao().selectWriterinfo(con, writer_no);
		
		close(con);
		
		return m;
	}

	//관심작가 작품 리스트
	public int wriSaleBoardCount(int writer_no) {
		Connection con = getConnection();
		
		int result = new FavDao().wriSaleBoardCount(con, writer_no);
		
		close(con);
		
		return result;
	}

	//관심작가 평점
	public int selectWriGrade(int writer_no) {
		Connection con = getConnection();
		
		int result = new FavDao().selectWriGrade(con, writer_no);
		
		close(con);
		
		return result;
	}

	//관심작가 진행중인 의뢰
	public int wriOrderCount(int writer_no) {
		Connection con = getConnection();
		
		int result = new FavDao().wriOrderCount(con, writer_no);
		
		close(con);
		
		return result;
	}

	//관심작가 프로필 사진
	public Files wriprofile(int writer_no) {
		Connection con = getConnection();

		Files f = new FavDao().selectProfile(con, writer_no);

		close(con);

		return f;
	}

}
