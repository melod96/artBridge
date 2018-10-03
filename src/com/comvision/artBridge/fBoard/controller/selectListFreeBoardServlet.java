package com.comvision.artBridge.fBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.fBoard.model.service.FreeBoardService;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;
import com.comvision.artBridge.fBoard.model.vo.PageInfo;

@WebServlet("/selectFreeBoardList.fb")
public class selectListFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public selectListFreeBoardServlet() {
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

				int listCount = new FreeBoardService().getListCount();

				maxPage = (int)((double)listCount/limit + 0.9);
				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 
				
				endPage = startPage + limit -1;
				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
				
				//자유게시판 리스트 출력
				//ArrayList<Notice> list = new NoticeService().selectList();
				ArrayList<FreeBoard> list = new FreeBoardService().selectFreeList(currentPage, limit);
				System.out.println(list);
			
				String page = "";
				if(list != null){
					page = "/views/fBoard/freeBoard.jsp";
					request.setAttribute("list", list);
					//request.setAttribute("list", new NoticeService().selectList());
					request.setAttribute("pi", pi);
				}else{
					page = "/views/common/errorPage.jsp";
					request.setAttribute("msg", "공지사항 보기 실패!");
				}
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
