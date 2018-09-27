package com.comvision.artBridge.main.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.main.model.dao.MainDao;

public class MainService {

	public ArrayList<Files> mainLoad() {
		
		
		Connection con = getConnection();
		
		ArrayList<Files> selectProfileImg = null;
		
		selectProfileImg = new MainDao().mainLoad(con);
		
		close(con);
		
		return selectProfileImg;
		
	}

	public ArrayList<Files> mainLoad2() {
		
		Connection con = getConnection();
		
		ArrayList<Files> selectProfileImg = null;
		
		selectProfileImg = new MainDao().mainLoad2(con);
		
		close(con);
		
		return selectProfileImg;
		
	}

	public ArrayList<Files> mainLoad3() {
		
		Connection con = getConnection();
		
		ArrayList<Files> newList = null;
		
		newList = new MainDao().mainLoad3(con);
		
		close(con);
		
		return newList;
	}

	public ArrayList<Notice> searchNoticeList() {
		
		Connection con = getConnection();
		
		ArrayList<Notice> noticeList = null;
		
		noticeList = new MainDao().searchNoticeList(con);
		
		close(con);
		
		return noticeList;
		
		
	}
	
	
	

}
