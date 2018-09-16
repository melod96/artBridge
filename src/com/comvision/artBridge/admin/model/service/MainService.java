package com.comvision.artBridge.admin.model.service;

import static com.comvision.artBridge.common.JDBCTemplate.close;
import static com.comvision.artBridge.common.JDBCTemplate.commit;
import static com.comvision.artBridge.common.JDBCTemplate.getConnection;
import static com.comvision.artBridge.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.comvision.artBridge.admin.model.dao.MainDao;
import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Main;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.board.model.dao.BoardDao;

public class MainService {

	public Main selectMain(Main mno) {
		Connection con = getConnection();
		
		Main m = new MainDao().selectMain(con, mno);
		
		
			close(con);
		

		return m;
		
	}

	
		

}
