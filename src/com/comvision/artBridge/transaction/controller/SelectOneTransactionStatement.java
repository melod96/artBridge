package com.comvision.artBridge.transaction.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.transaction.model.service.TransactionService;
import com.comvision.artBridge.transaction.model.vo.Transaction;

/**
 * Servlet implementation class SelectOneTransactionStatement
 */
@WebServlet("/selectTransOne.ts")
public class SelectOneTransactionStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneTransactionStatement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		Transaction t = new TransactionService().selectTransOne(mNo, orderNo);
		
		if(t != null){
			response.getWriter().print(t);
		}else{
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg",  "명세표 상세 조회 실패!");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
