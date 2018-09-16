package com.comvision.artBridge.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.comvision.artBridge.admin.model.dao.AdminDaoClone;
import com.comvision.artBridge.member.model.vo.Member;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class AdminServiceClone {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDaoClone().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new AdminDaoClone().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
