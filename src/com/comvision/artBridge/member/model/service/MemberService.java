package com.comvision.artBridge.member.model.service;

import com.comvision.artBridge.member.model.dao.MemberDao;
import com.comvision.artBridge.member.model.vo.Member;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {

	public Member loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, userId, userPwd);
		
		close(con);
		
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new MemberDao().insertMember(con, m);
		int currval = new MemberDao().selectMemberCurrval(con);
		int result2 = new MemberDao().insertMemberStatus(con, currval);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int idCheck(String userId) {
		Connection con = getConnection();
		int result = 0;
		
		result = new MemberDao().idCheck(con, userId);
		
		close(con);
		
		return result;
	}

	public int nickNameCheck(String nickName) {
		Connection con = getConnection();
		int result = 0;
		
		result = new MemberDao().nickNameCheck(con, nickName);
		
		close(con);
		
		return result;
	}

}
