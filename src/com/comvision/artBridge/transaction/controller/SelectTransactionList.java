package com.comvision.artBridge.transaction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.transaction.model.service.TransactionService;
import com.comvision.artBridge.transaction.model.vo.Transaction;
import com.google.gson.Gson;
import com.sun.xml.internal.ws.client.ResponseContext;

/**
 * Servlet implementation class SelectTransactionList
 */
@WebServlet("/selectTransListlhm.ts")
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
		// 페이징 처리
		/*int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		limit = 10;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
//		int listCount = new TransactionService().getListCount();

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);*/
		
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		System.out.println(mNo);
		
		ArrayList<Transaction> transList = new TransactionService().selectTransList(mNo);
		System.out.println(transList);
		
		String page = "";
		if(transList != null){
			//page= "views/myPage/myPageForm.jsp";
//			request.getSession().setAttribute("transList", transList);
			page= "views/myPage/mypagelhm.jsp";
			request.setAttribute("transList", transList);
//			request.getSession().setAttribute("transList", transList);
//			request.setAttribute("pi", pi);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(transList, response.getWriter());
		}else{
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트를 불러올 수 없습니다");
		}
			RequestDispatcher view = request.getRequestDispatcher("views/myPage/myPageForm.jsp");
			view.forward(request, response);
//			response.getWriter();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
