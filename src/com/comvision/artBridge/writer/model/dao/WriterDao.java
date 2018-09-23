package com.comvision.artBridge.writer.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
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
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		
		String query = prop.getProperty("selectPieceList");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				b = new Board();
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setMember_no(rset.getInt("member_no"));
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

	//첨부파일 저장용 메소드
	public int insertAttachment(Connection con, ArrayList<Files> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumb");
		
		try {
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getF_reference_no());
				System.out.println("1 : "  +  fileList.get(i).getF_reference_no());
				pstmt.setString(2, fileList.get(i).getFiles_title());
				System.out.println("2 : "  +  fileList.get(i).getFiles_title());
				pstmt.setString(3, fileList.get(i).getChange_title());
				System.out.println("3 : "  +  fileList.get(i).getChange_title());
				pstmt.setInt(4, fileList.get(i).getFiles_type());
				System.out.println("4 : "  +  fileList.get(i).getFiles_type());
				pstmt.setString(5, fileList.get(i).getFiles_root());
				System.out.println("5 : "  +  fileList.get(i).getFiles_root());
				
				result += pstmt.executeUpdate();
			}
			
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

}
