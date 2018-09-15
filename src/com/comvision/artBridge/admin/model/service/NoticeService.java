package com.comvision.artBridge.admin.model.service;

import java.sql.Connection;

import com.comvision.artBridge.admin.model.dao.NoticeDao;
import com.comvision.artBridge.admin.model.vo.Notice;
import static com.comvision.artBridge.common.JDBCTemplate.*;

public class NoticeService {
	
	//공지사항 등록용 메소드
	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

}
