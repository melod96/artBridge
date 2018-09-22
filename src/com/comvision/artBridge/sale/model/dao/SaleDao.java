package com.comvision.artBridge.sale.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;

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

import com.comvision.artBridge.board.model.dao.BoardDao;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.member.model.vo.Rating;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.sale.model.vo.Requirements;

public class SaleDao {
	
	private Properties prop = new Properties();

	public SaleDao(){
		String fileName= BoardDao.class.getResource("/sql/sale/sale-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<HashMap<String, Object>> selectOptionList(Connection con, int board_no) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap= null;
		ResultSet rset = null;
		
		String query= prop.getProperty("selectOptionList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String,Object>();
				
				hmap.put("board_no",rset.getInt("board_no"));
				hmap.put("options_name", rset.getString("options_name"));
				hmap.put("options_price", rset.getInt("options_price"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public Board selectBoardOneSalepage(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneSalepage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_type(rset.getInt("board_type"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setMember_no(rset.getInt("member_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_count(rset.getInt("board_count"));
				b.setResolution(rset.getInt("resolution"));
				b.setSubmit_file_type(rset.getString("submit_file_type"));
				b.setSubmit_size(rset.getString("submit_size"));
				b.setWorking_period(rset.getInt("working_period"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}

	//해당하는 이미지 조회
	public ArrayList<Files> selectFileList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Files> flist = null;
		
		String query = prop.getProperty("selectFileList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			flist = new ArrayList<Files>();
			while(rset.next()){
				Files f= new Files();
				
				f.setFiles_no(rset.getInt("files_no"));
				f.setF_reference_no(rset.getInt("f_reference_no"));
				f.setFiles_title(rset.getString("files_title"));
				f.setChange_title(rset.getString("change_title"));
				f.setFiles_type(rset.getInt("files_type"));
				f.setFiles_root(rset.getString("files_root"));
				f.setFiles_date(rset.getDate("files_date"));
				f.setFiles_secession(rset.getInt("files_secession"));
				
				flist.add(f);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return flist;
	}

	//해당하는 판매글의 연관검색어
	public ArrayList<Relate> selectRelateList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Relate> rlist = null;
		
		String query = prop.getProperty("selectRelateList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<Relate>();
			
			while(rset.next()){
				Relate r = new Relate();
				
				r.setRelate_no(rset.getInt("relate_no"));
				r.setRelate_name(rset.getString("relate_name"));
				
				rlist.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return rlist;
	}

	//해당하는 작가의 등급
	public Rating selectRating(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rating r= null;
		
		String query = prop.getProperty("selectRating");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				r= new Rating();
				
				r.setRating_no(rset.getInt("rating_no"));
				r.setRating_name(rset.getString("rating_name"));
				r.setSlot(rset.getInt("slot"));
				r.setCommission(rset.getInt("commission"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return r;
	}


	//해당하는 판매글의 후기
	public ArrayList<Grade> selectGradeList(Connection con, int num) {
		PreparedStatement pstmt  = null;
		ResultSet rset = null;
		ArrayList<Grade> glist = null;
		
		String query = prop.getProperty("selectGradeList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			glist = new ArrayList<Grade>();
			
			while(rset.next()){
				Grade g = new Grade();
				
				g.setBoard_no(rset.getInt("board_no"));
				g.setGrade(rset.getInt("grade"));
				g.setGrade_content(rset.getString("grade_content"));
				g.setNick_name(rset.getString("nick_name"));
				g.setGrade_date(rset.getDate("grade_date"));
				
				glist.add(g);
			}
			System.out.println(glist);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return glist;
	}
	
	//후기 등록
	public int insertGrade(Connection con, String content, int board_no, int member_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, member_no);
			pstmt.setInt(3, 2);
			pstmt.setString(4, content);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public Grade avgGrade(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Grade g = null;
		
		String query = prop.getProperty("avgGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				g = new Grade();
				g.setGrade(rset.getDouble("avg(g.grade)"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return g;
	}

	public int insertOrder(Connection con, String[] rsplit) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectOrderCurrval(Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertRequirements(Connection con, int currval, String[] rsplit) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertOrderDetail(Connection con, int currval) {
		// TODO Auto-generated method stub
		return 0;
	}


}
