package com.comvision.artBridge.admin.model.dao;

import static com.comvision.artBridge.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.comvision.artBridge.admin.model.vo.Rating;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.message.model.vo.Message;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.transaction.model.vo.Transaction;




public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao(){
		String fileName= AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//검색한 판매글 조회
	public ArrayList<Board> selectSaleList(Connection con, int currentPage, int limit, String kind, String keyword) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		String query = "";
		
		if(kind.equals("BOARD_NO")){
			 query = prop.getProperty("selectNoList");
		}else if(kind.equals("NICK_NAME")){
			 query = prop.getProperty("selectNameList");
		}else if(kind.equals("BOARD_TITLE")){
			 query = prop.getProperty("selectTitleList");
		}
		
		System.out.println(kind);
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			if(kind.equals("no")){
				pstmt.setInt(1, Integer.parseInt(keyword));
			}else{
			pstmt.setString(1, keyword);
			}
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_title(rset.getString("board_title"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//메인
	public int insertMain(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdmin");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoard_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	//연관검색어insert
	public int insertRelate(Connection con, String relate_name) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRelate");
		
		try {
			pstmt = con.prepareStatement(query);
			//pstmt.setInt(1, r.getRelate_no());
			pstmt.setString(1, relate_name);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	//연관검색어 전체 조회
	public ArrayList<Relate> selectRelate(Connection con) {
		ArrayList<Relate> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRelate");
		
		try {
			stmt = con.createStatement();
			rset=stmt.executeQuery(query);
			
			list = new ArrayList<Relate>();
			
			while(rset.next()){
				Relate r =new Relate();
				r.setRelate_no(rset.getInt("relate_no"));
				r.setRelate_name(rset.getString("relate_name"));
				
				list.add(r);

				
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally{
			
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int updateMainView(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int b = 0;
		
		String query = prop.getProperty("updateMainView");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			b = pstmt.executeUpdate();

		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}

	public ArrayList<Board> selectMainView(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = null;
		
		String query = prop.getProperty("selectMainView");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			blist = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				
				blist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return blist;
	}

	//게시글 전체 조회
	public ArrayList<Board> selectBoard(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_date(rset.getDate("board_date"));
				b.setBoard_title(rset.getString("board_title"));
				
				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;

	}
	
	//게시글 선택 조회
	public ArrayList<Board> selectBoardList(Connection con, int currentPage, int limit, String kind, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		String query = "";
		
		if(kind.equals("BOARD_NO")){
			 query = prop.getProperty("selectNoList");
		}else if(kind.equals("NICK_NAME")){
			 query = prop.getProperty("selectNameList");
		}else if(kind.equals("BOARD_TITLE")){
			 query = prop.getProperty("selectTitleList");
		}
		
		System.out.println(kind);
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) *limit +1;
			int endRow= startRow +limit -1;
			
			if(kind.equals("no")){
				pstmt.setInt(1, Integer.parseInt(keyword));
			}else{
			pstmt.setString(1, keyword);
			}
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			
			while(rset.next()){
				Board b= new Board();
				
				b.setBoard_no(rset.getInt("board_no"));
				b.setNick_name(rset.getString("nick_name"));
				b.setBoard_title(rset.getString("board_title"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Rating> selectRatingList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Rating> list = null;
		Rating r = null;
		
		String query = prop.getProperty("selectRatingList");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Rating>();
			
			while(rset.next()){
				r = new Rating();
				r.setRating_no(rset.getInt("rating_no"));
				r.setRating_name(rset.getString("rating_name"));
				r.setSlot(rset.getInt("slot"));
				r.setCommission(rset.getInt("commission"));
				
				list.add(r);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public int updateMainDelete(Connection con, int bno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int b = 0;
		
		String query = prop.getProperty("updateMainDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			b = pstmt.executeUpdate();

		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}
		
		
	public int insertRating(Connection con, Rating r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRating");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getRating_name());
			pstmt.setInt(2, r.getSlot());
			pstmt.setInt(3, r.getCommission());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateRating(Connection con, Rating r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateRating");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getRating_name());
			pstmt.setInt(2, r.getSlot());
			pstmt.setInt(3, r.getCommission());
			pstmt.setInt(4, r.getRating_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//거래내역 관리 전체 출력
		public ArrayList<Transaction> selectTrs(Connection con, int currentPage, int limit) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Transaction> list = null;
			
			
			String query = prop.getProperty("selectTrs");
			
			try {
				pstmt = con.prepareStatement(query);
				
				int startRow = (currentPage -1) * limit +1;
				int endRow= startRow +limit -1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Transaction>();
				
				while(rset.next()){
					Transaction t= new Transaction();
					
					t.setOrders_no(rset.getInt("orders_no"));
					t.setCusName(rset.getString("name"));
					t.setCusId(rset.getString("id"));
					t.setWrtNick(rset.getString("nick_name"));
					t.setWrtId(rset.getString("id"));
					t.setPay_status(rset.getInt("pay_status"));
					t.setO_date(rset.getDate("o_start_date"));
					t.setPayment(rset.getInt("payment"));
					t.setBoard_title(rset.getString("board_title"));

					list.add(t);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
			
			return list;
		}
		
		//회원관리
		public int getListCount(Connection con) {
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("memberListCount");
			
			int listCount = 0;
			
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()){
					listCount = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
				close(rset);
			}
			
			return listCount;
		}
		//회원관리
		public ArrayList<Member> selectList(Connection con, int currentPage, int limit, String addQuery) {
			Statement stmt = null;
			ResultSet rset = null;
			ArrayList<Member> list = null;
			Member m = null;
			
			String query = prop.getProperty("selectMemberList");
			
			try {
				stmt = con.createStatement();
				
				query += " " + addQuery;
				
				query += ") ";
				
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				String rnumQuery = "where rnum between " + startRow + " and " + endRow + " order by member_no desc";
				
				query += rnumQuery;
				
				System.out.println("최종 실행되는 Query : " + query);
				
				rset = stmt.executeQuery(query);
				
				list = new ArrayList<Member>();
				
				while(rset.next()){
					
					m = new Member();
					
					m.setMember_no(rset.getInt("member_no"));
					m.setId(rset.getString("id"));
					m.setName(rset.getString("name"));
					m.setPhone(rset.getString("phone"));
					m.setEmail(rset.getString("email"));
					m.setEnroll_date(rset.getDate("enroll_date"));
					m.setWriter_right(rset.getInt("writer_right"));
					m.setRating_name(rset.getString("rating_name"));
					m.setWriter_request_no(rset.getInt("writer_request_no"));

					
					list.add(m);
					
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
				close(rset);
			}
			
			return list;
		}

		public int deleteCommission(Connection con, int bno) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int b = 0;
			
			String query = prop.getProperty("DeleteCommission");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, bno);
				
				b = pstmt.executeUpdate();

			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
			return b;
	
		}

		//커미션관리 판매글 뷰
		public ArrayList<Board> selectCommissionView(Connection con) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Board> blist = null;
			
			String query = prop.getProperty("selectCommissionView");
			
			try {
				pstmt = con.prepareStatement(query);
				
				rset = pstmt.executeQuery();
				
				blist = new ArrayList<Board>();
				
				while(rset.next()){
					Board b = new Board();
					
					
					b.setBoard_no(rset.getInt("board_no"));
					
					blist.add(b);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
			
			return blist;
		}

		//transcation 서치
		public ArrayList<Transaction> searchTrs(Connection con, int currentPage, int limit, String addQuery) {
			Statement stmt = null;
			ResultSet rset = null;
			ArrayList<Transaction> list = null;
			
			String query = prop.getProperty("searchTrs");
			System.out.println("dao실행1");
			try {
				stmt = con.createStatement();
				
				query += " " + addQuery;
				
				query += ") ";
				
				int startRow = (currentPage -1) *limit +1;
				int endRow= startRow +limit -1;
				
				String rnumQuery = "where rnum between " + startRow + " and " + endRow ;
				
				query += rnumQuery;
				
				System.out.println("최종 실행되는 Query : " + query);
				
				rset = stmt.executeQuery(query);
				
				list = new ArrayList<Transaction>();
				
				
				while(rset.next()){
					Transaction t = new Transaction();
					t.setOrders_no(rset.getInt("orders_no"));
					t.setCusName(rset.getString("name"));
					t.setCusId(rset.getString("id"));
					t.setWrtNick(rset.getString("nick_name"));
					t.setWrtId(rset.getString("id"));
					t.setPay_status(rset.getInt("pay_status"));
					t.setO_date(rset.getDate("o_start_date"));
					t.setPayment(rset.getInt("payment"));
					t.setBoard_title(rset.getString("board_title"));

					list.add(t);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(stmt);
				close(rset);
			}
			
			return list;
		}
			
		public int[] selectMemberCounts(Connection con) {
			Statement stmt = null;
			ResultSet rset = null;
			int[] memberCounts = new int[3];
			
			String query = prop.getProperty("selectMemberCounts");
			
			try {
				stmt = con.createStatement();
			
				rset = stmt.executeQuery(query);
				
				int i = 0;
				while(rset.next()){
					memberCounts[i] = rset.getInt(1);
					i++;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
				close(rset);
			}
			
			
	
			return memberCounts;
		}

		public int[] selectOrderCounts(Connection con, String[] times) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int[] orderCounts = new int[4];
			
			String query = prop.getProperty("selectOrderCounts");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, times[1]);
				pstmt.setString(2, times[0]);
				pstmt.setString(3, times[2]);
				pstmt.setString(4, times[1]);
				pstmt.setString(5, times[3]);
				pstmt.setString(6, times[2]);
				pstmt.setString(7, times[4]);
				pstmt.setString(8, times[3]);
				
				rset = pstmt.executeQuery();
				
				int i = 0;
				while(rset.next()){
					orderCounts[i] = rset.getInt(1);
					i++;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
			return orderCounts;
		}
	
}
