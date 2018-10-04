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


/**
 * Servlet implementation class InsertConfirmRequest
 */
@WebServlet("/confirmCheck.ts")
public class ConfirmCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmCheckServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨펌 체크하려고 서블릿 왔엉");
		
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();

		int oNo = Integer.parseInt(request.getParameter("cusONo"));
		int actNo = Integer.parseInt(request.getParameter("cusActNo"));
		
		System.out.println("mNo : " + mNo + ", oNo : " + oNo + ", actNo : " + actNo);
		
		int result = new TransactionService().insertOdActNo(mNo, oNo, actNo);
//		ArrayList result = new TransactionService().insertOdActNo(mNo, oNo, actNo);
//		ArrayList<Transaction> result = new TransactionService().confirmRequest(mNo, oNo, actNo);
		
		System.out.println("서비스에서 돌아온 결과야 : " + result);
		String page = "";
		if(result > 0){
			System.out.println("성공 결과야 : " + result);
			
			response.getWriter();
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "컨펌 요청 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
/*		if((int)result.get(0) > 0){
			System.out.println("성공 결과야 : " + result);
			
			if(result.get(1) != null){				
				response.getWriter().println(result.get(1));
				System.out.println("1. 여기야 : " + response.getWriter());
			}
			System.out.println("2. 여기야 : " + response.getWriter());
			response.getWriter();
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "컨펌 요청 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
