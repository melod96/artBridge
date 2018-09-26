package com.comvision.artBridge.main.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.main.model.dao.MainDao;

public class MainService {

	public ArrayList<Files> mainLoad() {
		
		
		Connection con = getConnection();
		
		ArrayList<Files> selectProfileImg = null;
		
		selectProfileImg = new MainDao().selectProfileImg(con);
		
		close(con);
		
		return selectProfileImg;
		
	}

}
