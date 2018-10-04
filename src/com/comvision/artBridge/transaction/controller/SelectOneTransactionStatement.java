package com.comvision.artBridge.transaction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.comments.model.vo.Comments;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.sale.model.service.SaleService;
import com.comvision.artBridge.sale.model.vo.Requirements;
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
		int orderNoo = Integer.parseInt(request.getParameter("orderNoo"));
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
	
		
		Transaction t = new TransactionService().selectTransOne(mNo, orderNoo);
		ArrayList<Requirements> rlist = new SaleService().selectsaleRequirementsList(orderNoo, mNo);
		//작가 코멘트 출력
		ArrayList<Comments> clist = new SaleService().selectcommentlist(orderNoo);
		
		int price = new SaleService().totalPrice(orderNoo, mNo);
		
		String page = "";
		if(t != null){
			page= "views/myPage/paymentmodel.jsp";
			request.setAttribute("t", t);
			request.setAttribute("rlist", rlist);
			request.setAttribute("totalprice", price);
			if(clist.size() != 0){
				request.setAttribute("clist", clist);
			}
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg",  "명세표 상세 조회 실패!");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
