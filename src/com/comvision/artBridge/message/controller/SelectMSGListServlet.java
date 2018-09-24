package com.comvision.artBridge.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;
import com.comvision.artBridge.nBoard.model.service.NBoardService;

@WebServlet("/selectList.msg")
public class SelectMSGListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMSGListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = 1;
		// 페이징 처리
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		limit = 10;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = new MessageService().getListCount();

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		//메세지 리스트 출력
		ArrayList<Message> mlist = new MessageService().SelectList(currentPage, limit);
		
		String page = "";
		if(mlist != null){
			page = "/views/admin/customerAdmin.jsp";
			request.setAttribute("mlist", mlist);
			request.setAttribute("pi", pi);
			request.setAttribute("num", num);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
