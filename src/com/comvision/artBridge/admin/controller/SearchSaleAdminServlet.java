package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;

@WebServlet("/search.ad")
public class SearchSaleAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchSaleAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = request.getParameter("value");
		
		String[] arr = value.split(",");
		String kind = arr[0];
		String keyword = arr[1];
		
		//페이징 처리
				int currentPage;
				int limit;
				int maxPage;
				int startPage;
				int endPage;
				
				currentPage = 1;
				
				limit = 5;
				
				if(request.getParameter("currentPage")!= null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}


				int listCount = new BoardService().getListCount();


				maxPage = (int)((double)listCount/limit + 0.9);


				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


				endPage = startPage + limit -1;

				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
				
				
				//판매글 출력
				ArrayList<Board> list = new AdminService().selectSaleList(currentPage, limit, kind, keyword);
				
				String page = "";
				int num  = 2;
				if(list != null){
					page = "views/admin/mainAdmin.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
					request.setAttribute("num", num);
					request.setAttribute("value", value);
					
				}else{
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패");
				}
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
				
			}
	
		
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




/*package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;

@WebServlet("/search.ad")
public class SearchSaleAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchSaleAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = request.getParameter("value");
		
		String[] arr = value.split(",");
		String kind = arr[0];
		String keyword = arr[1];
		
		//페이징 처리
				int currentPage;
				int limit;
				int maxPage;
				int startPage;
				int endPage;
				
				currentPage = 1;
				
				limit = 5;
				
				if(request.getParameter("currentPage")!= null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}


				int listCount = new BoardService().getListCount();


				maxPage = (int)((double)listCount/limit + 0.9);


				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


				endPage = startPage + limit -1;

				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
				
				
				//판매글 출력
				ArrayList<Board> list = new AdminService().selectSaleList(currentPage, limit);
				
				String page = "";
				
				if(list != null){
					page = "views/admin/mainAdmin.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				}else{
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패");
				}
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
			}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
*/