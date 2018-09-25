package com.comvision.artBridge.transaction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.transaction.model.service.TransactionService;
import com.comvision.artBridge.transaction.model.vo.Transaction;

/**
 * Servlet implementation class SelectTransactionList
 */
@WebServlet("/selectTransList.ts")
public class SelectTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTransactionList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		ArrayList<Transaction> transList = new TransactionService().selectTransList(mNo);
		
		
		if(transList != null){
			request.setAttribute("transList", transList);
//			request.setAttribute("pi", pi);
		}else {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
		}
		
//		//페이징 처리 추가시 필요한 변수 선언
//				int currentPage; 	//현재 페이지 위치 (다음 조회 페이지를 구하기 위해)
//				int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
//				int maxPage;		//전체 페이지에서 가장 마지막 페이지
//				int startPage;		//한 번에 표시 될 페이지가 시작할 페이지(1~10 , 11~20 ... 목록의 첫 부분에 표시 될 페이지)
//				int endPage;		//한 번에 표시 될 페이지가 끝나는 페이지
//				
//				//게시판은 1페이지부터 시작함
//				currentPage = 1; 	//초기값 1페이지부터
//				
//				//한 페이지에 보여질 목록 갯수
//				
//				limit = 10;
//				
//				if(request.getParameter("currentPage") != null){
//					currentPage = Integer.parseInt(request.getParameter("currentPage"));
//				}
//				
//				//전체 목록 갯수를 리턴 받음(데이터베이스에 접근해야 알 수 있음)
//				int listCount = new BoardService().getListCount();
//				
//				//총 페이지 수 계산
//				//	ex) 목록 수가 123개이면 페이지가 13개가 필요함
//				maxPage = (int)((double)listCount / limit + 0.9);
//				// int/int => int형으로 반영 되므로 한 쪽을 double로 형변환 하여 double로 결과를 받아야 함
//				//=> (double)listCount / limit => 정수로 반환되면 페이지 수를 +1 할 필요가 없지만 소수점으로 반환 될 시 페이지 수를 +1 해야 함
//				//=> ((double)listCount / limit + 0.9) => 만약 총 페이지 수가 13개, limit 페이지 수가 10 일 때 (1.3 + 0.9 = 2.2)
//				//=> (int)((double)listCount / limit + 0.9)(int)2.2 => 2 즉 두 덩어리의 페이지 단위가 나옴) 
//				
//				//한 번에 표시 될 페이지 시작 페이지 숫자
//				startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
//				//			-> 10의 자리 숫자 떼어내는 공식						   <-
//				
//				//목록 아래쪽에 보여질 마지막 페이지 수(limit 갯수 단위로 끊었을 때 마지막 페이지에 발생하는 문제 해결)
//				endPage = startPage + limit - 1;
//				
//				if(maxPage < endPage){
//					endPage = maxPage;
//				}
//				
//				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
//				
//				
//				//페이징 처리 이전
//				//ArrayList<Board> list = new BoardService().selectList();
//				
//				//페이징 처리 이후
//				ArrayList<Board> list = new BoardService().selectList(currentPage, limit);
//				
//				String page = "";
//				
//				if(list != null){
//					page = "views/board/boardList.jsp";
//					request.setAttribute("list", list);
//					request.setAttribute("pi", pi);
//				}else {
//					page = "views/common/errorPage.jsp";
//					request.setAttribute("msg", "게시판 조회 실패!");
//				}
//				
//				RequestDispatcher view = request.getRequestDispatcher(page);
//				view.forward(request, response);
//		
//		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
