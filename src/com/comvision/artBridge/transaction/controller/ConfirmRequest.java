package com.comvision.artBridge.transaction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.transaction.model.service.TransactionService;
import com.comvision.artBridge.transaction.model.vo.Transaction;
import com.google.gson.Gson;


/**
 * Servlet implementation class InsertConfirmRequest
 */
@WebServlet("/confirmReq.ts")
public class ConfirmRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨펌 받으려고 서블릿 왔엉");

		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		int oNo = Integer.parseInt(request.getParameter("ordersNo"));
		int actNo = Integer.parseInt(request.getParameter("activityNo"));
		
		int result = new TransactionService().confirmRequest(mNo, oNo, actNo);
//		ArrayList<Transaction> result = new TransactionService().confirmRequest(mNo, oNo, actNo);
		
		if(result > 0){
			System.out.println("성공 결과야 : " + result);
			
			response.getWriter();
			
/*			if(result != null){
				System.out.println("성공 결과야 : " + result);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
//			new Gson().toJson(transList, response.getWriter());  이것도 가능 gson 개념 확인 다시 하기
				response.getWriter().print(new Gson().toJson(result));
				System.out.println(new Gson().toJson(result));
*/		}else{
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "컨펌 요청 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
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
