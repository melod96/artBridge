package com.comvision.artBridge.sale.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.sale.model.service.SaleService;
import com.comvision.artBridge.sale.model.vo.Requirements;

/**
 * Servlet implementation class SendDetailedListServlet
 */
@WebServlet("/senddetailedlist.sp")
public class SendDetailedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendDetailedListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req = request.getParameter("req");
		int member_no = Integer.parseInt(request.getParameter("member_no"));
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		int writer_no = Integer.parseInt(request.getParameter("writer_no"));
		String option = request.getParameter("option");
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println(option);
		System.out.println(price);
		
		String[] rsplit = req.split("@");
		
		int result = new SaleService().insertRequirements(rsplit, member_no, board_no, writer_no,option,price);
		String page = "";
		
		if(result >0){
			response.sendRedirect("selectOneSalepage.bo?num="+board_no);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "명세표 전송 실패");
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
