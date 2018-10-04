package com.comvision.artBridge.sale.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.sale.model.service.SaleService;

/**
 * Servlet implementation class PaymentEndingServlet
 */
@WebServlet("/paymentending.pg")
public class PaymentEndingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customer_no = Integer.parseInt(request.getParameter("customer_no"));
		int orders_no = Integer.parseInt(request.getParameter("orders_no"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String imp_uid = request.getParameter("imp_uid");
		String apply_num = request.getParameter("apply_num");
		
		System.out.println(customer_no);
		System.out.println(orders_no);
		System.out.println(totalPrice);
		System.out.println(imp_uid);
		System.out.println(apply_num);
		
		int result = new SaleService().insertPayment(customer_no, orders_no, totalPrice,imp_uid,apply_num);
		
		String page= "";
		if(result>0){
			page = "selectTransList.ts";
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패");
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
