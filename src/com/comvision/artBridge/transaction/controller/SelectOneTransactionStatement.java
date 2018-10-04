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
import com.google.gson.Gson;

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
		
		System.out.println("셀렉트원이야 들어오니? : " + orderNoo);
		
		Transaction t = new TransactionService().selectTransOne(mNo, orderNoo);
		ArrayList<Requirements> rlist = new SaleService().selectsaleRequirementsList(orderNoo, mNo);
		//작가 코멘트 출력
		ArrayList<Comments> clist = new SaleService().selectcommentlist(orderNoo);
		
		int price = new SaleService().totalPrice(orderNoo, mNo);
		
		System.out.println("t : " + t);
		System.out.println("rlist : " + rlist);
		System.out.println("clist : " + clist);
		System.out.println("price : " + price);
		
		String page = "";
		if(t != null){
			System.out.println("여기로 오니?");
		
			page= "views/myPage/statementModal.jsp";
			request.setAttribute("t", t);
			request.setAttribute("rlist", rlist);
			request.setAttribute("totalprice", price);
			if(clist.size() != 0){
				request.setAttribute("clist", clist);
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			System.out.println("t gson이야 : " + new Gson().toJson(rlist));
			System.out.println("rlist gson이야 : " + new Gson().toJson(rlist));
			System.out.println("clist gson이야 : " + new Gson().toJson(clist));
			System.out.println("price gson이야 : " + new Gson().toJson(price));
			System.out.println(response.getWriter());
			
			response.getWriter().print(new Gson().toJson(t));
			response.getWriter().print(new Gson().toJson(rlist));
			response.getWriter().print(new Gson().toJson(clist));
			response.getWriter().print(new Gson().toJson(price));
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
