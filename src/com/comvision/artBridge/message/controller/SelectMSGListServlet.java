package com.comvision.artBridge.message.controller;

import java.io.IOException;
import java.sql.Date;
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

@WebServlet("/selectList.msg")
public class SelectMSGListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public SelectMSGListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date1 = null;
		String date2 = null;
		Date date11 = null;
		
		String addQuery ="";
		//날짜로 검색.
		if(request.getParameter("date1") != null && request.getParameter("date2") != null){
			date1 = request.getParameter("date1");
			date2 = request.getParameter("date2");
		
			addQuery += "and message_date between '" +date1+"' and '"+date2 + "' ";
		}
		
		//옵션 1 : 답변상태
		String searchSelect1 = null;
		if(request.getParameter("searchSelect1") != null){
			searchSelect1 = request.getParameter("searchSelect1");
			
			switch(searchSelect1){
			case "se1Option1" : break;
			case "se1Option2" : addQuery += "and check_date is null "; break;
			case "se1Option3" : addQuery += "and check_date is not null "; break;
			}
		}
		
		//옵션 2 : 이름 or 제목
		
		String searchWords = null;
		String searchSelect2 = null;
		
		if (request.getParameter("searchWords") != "") {
			searchWords = request.getParameter("searchWords");
			System.out.println(searchWords);
			if (request.getParameter("searchSelect2") != null) {
				searchSelect2 = request.getParameter("searchSelect2");
				switch (searchSelect2) {
				case "se2Option1": addQuery += "and (name || message_title ) like '%" + searchWords + "	%' ";
					break;
				case "se2Option2":
					addQuery += "and name like '%" + searchWords + "%' ";
					break;
				case "se2Option3":
					addQuery += "and message_title like '%" + searchWords + "%' ";
					break;
				}

			}
		}
		
		
		
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
		ArrayList<Message> mlist = new MessageService().SelectList(currentPage, limit, addQuery);
		
		String page = "";
		
		if(mlist != null){
			page = "views/admin/customerAdmin.jsp";
			request.setAttribute("mlist", mlist);
			request.setAttribute("pi", pi);
			request.setAttribute("num", num);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "에러러ㅓ러ㅓ러!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
