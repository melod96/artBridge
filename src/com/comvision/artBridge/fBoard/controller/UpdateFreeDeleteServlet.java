package com.comvision.artBridge.fBoard.controller;

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
import com.comvision.artBridge.fBoard.model.service.FreeBoardService;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;

@WebServlet("/deleteFree.fb")
public class UpdateFreeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateFreeDeleteServlet() {
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
		
		
		//삭제할 게시물의 고유 넘버를 가져옴(체크박스 체크한 만큼을 배열로 가져옴)
		String[] contCheck = request.getParameterValues("contCheck"); 
		
		ArrayList<FreeBoard> list = new FreeBoardService().delFreeBoard(contCheck, currentPage, limit);
		
		String page = "";
		if(list != null){
			page = "selectFreeBoardList.fb";
			//request.setAttribute("list", list);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
