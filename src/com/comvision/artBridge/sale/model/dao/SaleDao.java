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
import com.comvision.artBridge.sale.model.vo.Options;
import com.comvision.artBridge.sale.model.vo.Orders;
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
	/*public ArrayList<Files> selectFileList(Connection con, int num) {
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
	}*/

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
	public int insertGrade(Connection con, String content, int board_no, int member_no, int grade) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			pstmt.setInt(2, member_no);
			pstmt.setInt(3, grade);
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

	//평점 평균
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
				g.setGrade(rset.getInt("avg(g.grade)"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return g;
	}

	public int insertOrder(Connection con, int member_no, int board_no, int writer_no) {
		PreparedStatement pstmt =  null;
		int result = 0;
		
		String query = prop.getProperty("insertOrder");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, member_no);
			pstmt.setInt(2, board_no);
			pstmt.setInt(3, writer_no);
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int selectOrderCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		
		String query = prop.getProperty("selectOrderCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				result = rset.getInt("currval");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return result;
	}

	public int insertRequirements(Connection con, int member_no, int currval, String rsplit) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRequirements");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			pstmt.setInt(2, member_no);
			pstmt.setString(3, rsplit);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int insertOrderDetail(Connection con, int currval) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
	public int insertRootOption(Connection con, int member_no, int currval, String option, int price) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRootOption");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			pstmt.setInt(2, member_no);
			pstmt.setString(3, option);
			pstmt.setInt(4, price);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


	public ArrayList<HashMap<String, Object>> selectFileAllList(Connection con, int board_no) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap= null;

		ResultSet rset = null;
		
		String query = prop.getProperty("selectFileList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String,Object>();
				
				hmap.put("board_no", rset.getInt("board_no"));
				hmap.put("board_title", rset.getString("board_title"));
				hmap.put("board_content", rset.getString("board_content"));
				hmap.put("files_root", rset.getString("files_root"));
				hmap.put("member_no", rset.getInt("member_no"));
				hmap.put("nick_name", rset.getString("nick_name"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Files> selectFileList(Connection con, int board_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		Files f = null;
		ArrayList<Files> list = null;
		
		String query = prop.getProperty("selectFileList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Files>();
			
			while(rset.next()){
				b = new Board();
				f = new Files();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setBoard_title(rset.getString("board_title"));
				b.setBoard_content(rset.getString("board_content"));
				f.setFiles_root(rset.getString("files_root"));
				b.setMember_no(rset.getInt("member_no"));
				b.setNick_name(rset.getString("nick_name"));
				
				list.add(f);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public Files selectProfile(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Files f= null;
		
		String query = prop.getProperty("selectProfile");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				f= new Files();
				f.setF_reference_no(rset.getInt("F_REFERENCE_NO"));
				f.setFiles_root(rset.getString("files_root"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}

	public int selectBoard_no(Connection con, int orders_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectBoard_no");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, orders_no);
			
			rset = pstmt.executeQuery();
			
			Orders o = new Orders();
			if(rset.next()){				
				o.setBoard_no(rset.getInt("board_no"));
			}
			result = o.getBoard_no();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public Board selectBoard(Connection con, int board_no) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		Board b = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b =new Board();
				b.setBoard_title(rset.getString("board_title"));
				b.setNick_name(rset.getString("nick_name"));
				b.setResolution(rset.getInt("resolution"));
				b.setSubmit_file_type(rset.getString("submit_file_type"));
				b.setSubmit_size(rset.getString("submit_size"));
				b.setWorking_period(rset.getInt("working_period"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}

	public ArrayList<Requirements> selectsaleRequirementsList(Connection con, int orders_no, int customer_no) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Requirements> olist = null;
		Requirements r = null;
		
		String query = prop.getProperty("selectsaleRequirementsList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, orders_no);
			pstmt.setInt(2, customer_no);
			
			rset = pstmt.executeQuery();
			
			olist = new ArrayList<Requirements>();
			while(rset.next()){
				r = new Requirements();
				r.setRequirements_content(rset.getString("REQURIEMENTS_CONTENT"));
				r.setRequirement_price(rset.getInt("REQUIREMENT_PRICE"));
				
				olist.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return olist;
	}

	public int insertPayment(Connection con, int customer_no, int orders_no, int totalPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, orders_no);
			pstmt.setInt(2, customer_no);
			pstmt.setInt(3, totalPrice);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectPaymentCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		
		String query = prop.getProperty("selectPaymentCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				result = rset.getInt("currval");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return result;
	}

	public int insertPaymentDetail(Connection con, int currval) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPaymentDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currval);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	

	

	


}
