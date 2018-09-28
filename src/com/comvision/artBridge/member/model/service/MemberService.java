package com.comvision.artBridge.member.model.service;

import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.dao.MemberDao;
import com.comvision.artBridge.member.model.vo.Member;

import static com.comvision.artBridge.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int pwdCheck(String userId, String userPwd) {
		Connection con = getConnection();
		
		int result = new MemberDao().pwdCheck(con, userId, userPwd);
		
		close(con);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<String> findId(String name, String email) {
		Connection con = getConnection();
		
		ArrayList<String> idList = new MemberDao().findId(con, name, email);
		
		close(con);
		
		return idList;
	}

	public int findPassword(String id, String name, String email) {
		Connection con = getConnection();
		
		int member_no = new MemberDao().findPassword(con, id, name, email);
		
		close(con);
		
		return member_no;
	}

	public int chagePassword(int member_no, String password) {
		Connection con = getConnection();
		
		int result = new MemberDao().changePassword(con, member_no, password);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteMemberRequest(int mNo) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteMemberRequest(con, mNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteAbleChceck(int mNo) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteAbleCheck(con, mNo);
		
		close(con);
		
		return result;
	}
	
	public int request_writerRight(Member m, ArrayList<Files> fileList) {
		Connection con = getConnection();
		System.out.println("2. 작가 신청 양식 전송 서비스입니다. 들어오네요~");
		int result = 0;
		int result1 = new MemberDao().request_writerRight(con, m);
		System.out.println("6-1. 업데이트 정보 갯수 : " + result1);
		System.out.println("6-2. memberTB없뎃 쿼리 dao에서 실행하고 다시 service로 왔어용~ 이번엔 첨부파일을 저장해볼까요~?");
		int result2 = new MemberDao().confirmImg_writerRight(con, fileList);
		System.out.println("6-3. 사진 인서트 갯수 : " + result2);
		
		if(result1 > 0 && result2 >= 3){
			result = result1 + result2;
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
}
