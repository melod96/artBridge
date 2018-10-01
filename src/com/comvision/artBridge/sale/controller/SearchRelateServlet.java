package com.comvision.artBridge.sale.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.sale.model.service.SaleService;

/**
 * Servlet implementation class SearchRelateServlet
 */
@WebServlet("/searchRelate.pg")
public class SearchRelateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchRelateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String relate = request.getParameter("relate");
		int relateNo = new SaleService().selectRelateNo(relate);
		
		//페이징 처리
				int currentPage;
				int limit;		
				int maxPage; 	
				int startPage;	
				int endPage; 	


				currentPage = 1;


				limit = 10;

				if(request.getParameter("currentPage")!= null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}


				int listCount = new SaleService().getRelateListCount(relateNo);


				maxPage = (int)((double)listCount/limit + 0.9);


				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


				endPage = startPage + limit -1;

				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);


				//판매글 출력
//				ArrayList<Board> list = new BoardService().searchKeywordList(currentPage, limit,search);
				ArrayList<Board> list = new SaleService().searchRelateList(currentPage, limit, relateNo);

				//해당하는 판매글의 옵션
				ArrayList<HashMap<String,Object>> opmap = new ArrayList<HashMap<String,Object>>();
				for(Board b : list){
					ArrayList<HashMap<String, Object>> oplist = new SaleService().selectOptionList(b.getBoard_no());

					opmap.addAll(oplist);
				}

				//연관 검색어 출력
				ArrayList<Relate> rlist = new BoardService().selectRelateList();
				
				//한 게시글 마다 해당하는 이미지 파일 불러오기
						ArrayList<HashMap<String, Object>> alist = new ArrayList<HashMap<String,Object>>();
						for(Board b : list){
							ArrayList<HashMap<String, Object>> hlist = 	new SaleService().selectFileAllList(b.getBoard_no());
							
							alist.addAll(hlist);
						}

					String page = "";

					if(list != null && alist != null && pi !=null && rlist !=null && opmap !=null){
						page = "views/sale/salepage.jsp";
						request.setAttribute("list", list);
						request.setAttribute("alist", alist);
						request.setAttribute("pi", pi);
						request.setAttribute("rlist", rlist);
						request.setAttribute("oplist", opmap);
					}else{
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "게시판 조회 실패");
					}
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
