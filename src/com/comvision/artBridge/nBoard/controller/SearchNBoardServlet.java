package com.comvision.artBridge.nBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.nBoard.model.service.NBoardService;

@WebServlet("/search.nb")
public class SearchNBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchNBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		System.out.println("search : " + search);
		
		//페이징 처리
		int currentPage;
		int limit;		
		int maxPage; 	
		int startPage;	
		int endPage; 	


		currentPage = 1;


		limit = 10;

		if(request.getParameter("currentPage")!= null){
			System.out.println();
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = new NBoardService().getSearchListCount(search);


		maxPage = (int)((double)listCount/limit + 0.9);


		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


		endPage = startPage + limit -1;

		
		if(maxPage<endPage){
			
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
		int num = 0;
		
		ArrayList<Notice> list = new NBoardService().searchNotice(currentPage, limit,search);
		 
		String page = "";
		
		if(list != null){
			page = "/views/notice/noticeBoardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("search", search);
			request.setAttribute("num", num);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 검색 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
