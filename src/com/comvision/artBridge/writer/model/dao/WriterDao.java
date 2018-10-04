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
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.sale.model.vo.Options;

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

	//페이징처리
	public int getListCount(Connection con, int memberNo) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
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
			//pstmt.setString(1, m.getNick_name());
			pstmt.setString(1, m.getIntroduction());
			pstmt.setInt(2, m.getWriter_slot());
			pstmt.setInt(3, m.getReception_status());
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
				//pstmt.setString(4, fileList.get(i).getFiles_root());
				
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
				//f.setFiles_title(rset.getString("files_title"));
				f.setChange_title(rset.getString("change_title"));
				//f.setFiles_type(rset.getInt("files_type"));
				f.setFiles_root(rset.getString("files_root"));
				f.setFiles_date(rset.getDate("files_date"));
				
				selectProfileImg.add(f);
				//System.out.println(selectProfileImg);
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
		
		String query = prop.getProperty("insertRelate");
		
		System.out.println("연관검색어 번호 : " + relateCk);
		System.out.println("보드 번호 : " + currval);
		
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
	
	//작품 등록시 옵션 및 가격 저장용 메소드
	public int insertOptions(Connection con, Options options, int currval, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOptions");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			pstmt.setInt(2, memberNo);
			pstmt.setString(3, options.getOptions_name());
			pstmt.setInt(4, options.getOptions_price());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	//board currval(보드테이블의 고유 넘버를 가져오기 위함)
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

	//작가 별점 노출용 메소드
	public int selectWriterAvg(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectWriterAvg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(2);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return result;
	}

	//진행중인 의뢰 갯수 노출
	public int OrderIngCount(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectOrderIngCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return result;
	}

	//작가 작품관리 리스트(썸네일 포함)
	public ArrayList<HashMap<String, Object>> selectBoardWithThumbImg(Connection con, int currentPage, int limit, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<Files> selectThumbImg = new ArrayList<Files>();
		Board b = new Board();
		Files f = null;
		
		String query = prop.getProperty("selectPieceListThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= (startRow +limit -1) * 3;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			selectThumbImg = new ArrayList<Files>();
			
			while(rset.next()){
				if(b.getBoard_no() == 0){
					b.setBoard_no(rset.getInt("board_no"));
					b.setBoard_title(rset.getString("board_title"));
					b.setBoard_content(rset.getString("board_content"));
					b.setBoard_date(rset.getDate("board_date"));
					b.setMember_no(rset.getInt("member_no"));
				}
				
				if(b.getBoard_no() == rset.getInt("board_no")){
					f = new Files();
					f.setFiles_title(rset.getString("files_title"));
					f.setChange_title(rset.getString("change_title"));
					f.setFiles_type(rset.getInt("files_type"));
					f.setFiles_root(rset.getString("files_root"));

					selectThumbImg.add(f);
				} else {
					hmap.put("board", b);
					hmap.put("selectThumbImg", selectThumbImg);
					list.add(hmap);
					
					hmap = new HashMap<String, Object>();
					selectThumbImg = new ArrayList<Files>();

					b = new Board();
					b.setBoard_no(rset.getInt("board_no"));
					b.setBoard_title(rset.getString("board_title"));
					b.setBoard_content(rset.getString("board_content"));
					b.setBoard_date(rset.getDate("board_date"));
					b.setMember_no(rset.getInt("member_no"));
					
					f = new Files();
					f.setFiles_title(rset.getString("files_title"));
					f.setChange_title(rset.getString("change_title"));
					f.setFiles_type(rset.getInt("files_type"));
					f.setFiles_root(rset.getString("files_root"));

					selectThumbImg.add(f);
				}
			}
			
			hmap.put("board", b);
			hmap.put("selectThumbImg", selectThumbImg);
			list.add(hmap);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//작품 수정하기 폼 메소드(board데이터 + 썸네일)
	public HashMap<String, Object> selectPieceData(Connection con, int memberNo, int pieceNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Board b = new Board();
		Files f = new Files();
		Relate rc = null;
		ArrayList<Files> selectThumbImg = null;
		ArrayList<Relate> relateCk = null;
		
		String query = prop.getProperty("selectPieceData");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, pieceNo);
			
			rset = pstmt.executeQuery();
			
			selectThumbImg = new ArrayList<Files>();
			relateCk = new ArrayList<Relate>();
			hmap = new HashMap<String, Object>();
			Files f1 = new Files();
			Files f2 = new Files();
			Files f3 = new Files();
			
			
			while(rset.next()){

				b = new Board();
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setResolution(rset.getInt("resolution"));
				b.setSubmit_file_type(rset.getString("submit_file_type"));
				b.setSubmit_size(rset.getString("submit_size"));
				b.setWorking_period(rset.getInt("working_period"));
				
				if(rset.getInt("files_type") == 2) {
					f1.setFiles_title(rset.getString("files_title"));
					f1.setChange_title(rset.getString("change_title"));
					f1.setFiles_type(rset.getInt("files_type"));
					f1.setFiles_root(rset.getString("files_root"));
				}
				
				if(rset.getInt("files_type") == 3) {
					f2.setFiles_title(rset.getString("files_title"));
					f2.setChange_title(rset.getString("change_title"));
					f2.setFiles_type(rset.getInt("files_type"));
					f2.setFiles_root(rset.getString("files_root"));
				}
				
				if(rset.getInt("files_type") == 4) {
					f3.setFiles_title(rset.getString("files_title"));
					f3.setChange_title(rset.getString("change_title"));
					f3.setFiles_type(rset.getInt("files_type"));
					f3.setFiles_root(rset.getString("files_root"));
				}
			
				rc = new Relate();
				rc.setRelate_no(rset.getInt("relate_no"));
				rc.setRelate_name(rset.getString("relate_name"));
				relateCk.add(rc);

			}
			selectThumbImg.add(f1);
			selectThumbImg.add(f2);
			selectThumbImg.add(f3);
			hmap.put("board", b);
			hmap.put("selectThumbImg", selectThumbImg);
			hmap.put("relateCk", relateCk);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return hmap;
	}

	//작품 수정하기 폼 메소드(옵션 가져오기)
	public ArrayList<Options> selectOptionsList(Connection con, int memberNo, int pieceNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		ArrayList<Options> selectOptionsList = null;
		Options op = null;
		
		String query = prop.getProperty("selectOptionsList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pieceNo);
			pstmt.setInt(2, memberNo);
			
			System.out.println("pieceNo" + pieceNo);
			System.out.println("memberNo" + memberNo);
			
			rset = pstmt.executeQuery();
			
			selectOptionsList = new ArrayList<Options>();
			
			while(rset.next()){
				op = new Options();
				op.setOptions_price(rset.getInt("options_price"));
				op.setOptions_name(rset.getString("options_name"));
				
				selectOptionsList.add(op);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return selectOptionsList;
	}

	//작품 수정용 메소드(데이터)
	public int updatePiece(Connection con, Board b, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePiece");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_title());
			pstmt.setString(2, b.getBoard_content());
			pstmt.setInt(3, b.getResolution());
			pstmt.setString(4, b.getSubmit_file_type());
			pstmt.setString(5, b.getSubmit_size());
			pstmt.setInt(6, b.getWorking_period());
			pstmt.setInt(7, b.getBoard_no());
			pstmt.setInt(8, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	//작품 수정용 메소드(첨부파일)
	public int updateAttachment(Connection con, Files files, int pieceNo, int file_type) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, files.getFiles_title());
			pstmt.setString(2, files.getChange_title());
			pstmt.setInt(3, pieceNo);
			pstmt.setInt(4, file_type);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
	
		return result;
	}

	//작품 수정용 메소드(옵션삭제)
	public int updateOptions(Connection con, int pieceNo, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOptions");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pieceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//작품 수정용 메소드(연관검색어삭제)
	public int updateRelate(Connection con, int pieceNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRelate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pieceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectWriter(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("selectWriter");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				m = new Member();
				
				m.setNick_name(rset.getString("nick_name"));
				m.setIntroduction(rset.getString("introduction"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

}
