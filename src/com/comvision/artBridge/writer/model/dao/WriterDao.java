package com.comvision.artBridge.writer.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.relate.model.vo.Relate;

import static com.comvision.artBridge.common.JDBCTemplate.*;

public class WriterDao {
	
	private Properties prop = new Properties();
	
	public WriterDao(){
		String fileName = WriterDao.class.getResource("/sql/writer/writer-query.properties").getPath();
				
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//작가 작품관리 리스트 출력
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		
		String query = prop.getProperty("selectPieceList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				b = new Board();
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setBoard_date(rset.getDate("board_date"));
				//b.setMember_no(rset.getInt("member_no"));
				//b.setModify_date(rset.getDate("modify_date"));
				b.setBoard_status(rset.getInt("board_status"));
				b.setBoard_count(rset.getInt("board_count"));
				b.setMain_view(rset.getInt("main_view"));
				
				list.add(b);
				//System.out.println(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//페이징처리
	public int getListCount(Connection con) {
		Statement stmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	//작가 작품등록 메소드
	public int insertPiece(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPiece");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_title());
			pstmt.setString(2, b.getBoard_content());
			pstmt.setInt(3, b.getMember_no());
			pstmt.setInt(4, b.getResolution());
			pstmt.setString(5, b.getSubmit_file_type());
			pstmt.setString(6, b.getSubmit_size());
			pstmt.setInt(7, b.getWorking_period());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
	//썸네일 저장시 해당 게시글 번호 도출 -->필요없음
	/*public Board boardNoCk(Connection con, Board b) {
		PreparedStatement pstmt = null;
		Board boardNo = null;
		ResultSet rset = null;
		String query = prop.getProperty("boardNoCk");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getMember_no());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				boardNo = new Board();
				boardNo.setBoard_no(rset.getInt("board_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
			
		}
		
		return boardNo;
	}*/

	//첨부파일 저장용 메소드
	public int insertAttachment(Connection con, Files files, int currval, int i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			pstmt.setString(2, files.getFiles_title());
			pstmt.setString(3, files.getChange_title());
			pstmt.setInt(4, i);
			pstmt.setString(5, files.getFiles_root());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
	
		return result;
	}
	
	//연관검색어 노출용 메소드
	public ArrayList<Relate> relateWord(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Relate> relate = null;
		Relate r = null;
		
		String query = prop.getProperty("selectRelate");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			relate = new ArrayList<Relate>();
			
			while(rset.next()){
				r = new Relate();
				r.setRelate_no(rset.getInt("relate_no"));
				r.setRelate_name(rset.getString("relate_name"));

				relate.add(r);
				//System.out.println(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return relate;
	}

	//커미션 삭제용 메소드
	public int deletePiece(Connection con, int pieceNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePiece");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pieceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	//프로필 저장용 메소드
	public int updateProfile(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProfile");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getNick_name());
			pstmt.setString(2, m.getIntroduction());
			pstmt.setInt(3, m.getWriter_slot());
			//pstmt.setInt(3, m.setReception_status(););
			pstmt.setInt(4, m.getMember_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	//프로필 이미지 저장용 메소드
	public int updateProfileImg(Connection con, ArrayList<Files> fileList, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProfileImg");
		
		try {
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, m.getMember_no());
				pstmt.setString(2, fileList.get(i).getFiles_title());
				pstmt.setString(3, fileList.get(i).getChange_title());
				pstmt.setString(4, fileList.get(i).getFiles_root());
				
				result += pstmt.executeUpdate();
				System.out.println("여기서 결과 : " + result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	//프로필 사진 노출용 메소드
	public ArrayList<Files> selectProfileImg(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Files> selectProfileImg = null;
		Files f = null;
		
		String query = prop.getProperty("selectProfileImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			selectProfileImg = new ArrayList<Files>();
			
			while(rset.next()){
				f = new Files();
				f.setFiles_no(rset.getInt("files_no"));
				//f.setF_reference_no(rset.getInt("f_reference_no"));
				f.setFiles_title(rset.getString("files_title"));
				f.setChange_title(rset.getString("change_title"));
				f.setFiles_type(rset.getInt("files_type"));
				f.setFiles_root(rset.getString("files_root"));
				f.setFiles_date(rset.getDate("files_date"));
				f.setFiles_secession(rset.getInt("files_secession"));
				
				selectProfileImg.add(f);
				System.out.println(selectProfileImg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return selectProfileImg;
	}

	//작품 등록시 연관검색어 등록 메소드
	public int relateNumList(Connection con, String relateCk, int currval) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("InsertRelate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			pstmt.setString(2, relateCk);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	//board currval
	public int selectBoardCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectBoardCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				result = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	

}
