package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.admin.model.vo.Transaction;

@WebServlet("/selectTrs.ad")
public class SelectTrsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SelectTrsServlet() {
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
		
		String searchWords = null;
		String searchSelect2 = null;
		
		if (request.getParameter("searchWords") != "") {
			searchWords = request.getParameter("searchWords");
			System.out.println(searchWords);
			if (request.getParameter("searchSelect2") != null) {
				searchSelect2 = request.getParameter("searchSelect2");
				switch (searchSelect2) {
				case "se2Option1": addQuery += "and name like '%" + searchWords + "%' or nick_name like '%" + searchWords + "%' or id like '%" + searchWords + "%' ";
					break;
				case "se2Option2":
					addQuery += "and name like '%" + searchWords + "%' ";
					break;
				case "se2Option3":
					addQuery += "and nick_name like '%" + searchWords + "%' ";
					break;
				case "se2Option4":
					addQuery += "and id like '%" + searchWords + "%' ";
					break;
				}

			}
		}
		
		//거래내역 전체조회
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

		int listCount = 0;
		listCount = new AdminService().getTrsListCount();


		maxPage = (int)((double)listCount/limit + 0.9);


		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


		endPage = startPage + limit -1;

		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);

		//게시글 전체 출력
		ArrayList<Transaction> list = new AdminService().selectTrs(currentPage, limit, addQuery);
		System.out.println(list);
		
		String page = "";
		int num = 1;
		if(list != null){
			page = "views/admin/transactionAdmin.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("pageName", request.getParameter("pageName"));
			request.setAttribute("num", num);
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
