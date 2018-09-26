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
 * Servlet implementation class PaymentAPIinfoServlet
 */
@WebServlet("/paymentAPIinfo.pg")
public class PaymentAPIinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentAPIinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customer_no = Integer.parseInt(request.getParameter("customer_no"));
		int totalPrice = Integer.parseInt(request.getParameter("total_Price"));
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String customer_email = email1+"@"+email2;
		String customer_phone = request.getParameter("phone");
		String bank_name = request.getParameter("bank_name");
		
		//주문 번호
//		int orders_no = Integer.parseInt(request.getParameter("orders_no"));
		int orders_no = 4;
		
		String page = "";
		
			page = "views/sale/paymentAPI.jsp";
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("customer_email", customer_email);
			request.setAttribute("customer_phone", customer_phone);
			request.setAttribute("bank_name", bank_name);
			request.setAttribute("customer_no", customer_no);
			request.setAttribute("orders_no", orders_no);
		
		
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
