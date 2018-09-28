package com.comvision.artBridge.admin.controller;

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

@WebServlet("/searchNotice.no")
public class SelectSearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

		int listCount = new NoticeService().getListCount();

		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 
		
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
		
		//공지사항 검색
		String search = request.getParameter("search");
		
		System.out.println(search);
				
		ArrayList<Notice> list = new NoticeService().searchNotice(search, currentPage, limit);
		 
		String page = "";
		if(list != null){
			page = "/views/admin/noticeList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
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
