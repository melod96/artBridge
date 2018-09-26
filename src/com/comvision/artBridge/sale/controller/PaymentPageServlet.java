package com.comvision.artBridge.sale.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.sale.model.service.SaleService;
import com.comvision.artBridge.sale.model.vo.Requirements;

/**
 * Servlet implementation class PaymentPageServlet
 */
@WebServlet("/paymentpage.pg")
public class PaymentPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//해당 주문 번호 받아오기
		//orders_no = 1일때
		int orders_no= 4;
		int customer_no= 1;
		int writer_no = 2;
//		int orders_no = Integer.parseInt(request.getParameter("orders_no"));
//		int writer_no = Integer.parseInt(request.getParameter("writer_no"));
//		int customer_no = Integer.parseInt(request.getParameter("member_no"));
//		String main_option = request.getParameter("main_option");
//		int total = Integer.parseInt(request.getParameter("total"));
		//오더번호로 보더넘버를 받아와서 해주면 될 것 같지욤
		int board_no = new SaleService().selectBoard_no(orders_no);
		Board b = new SaleService().selectBoard(board_no);
		//요구사항 출력arraylist사용
//		ArrayList<Options> olist = new SaleService().selectsaleOptionList(board_no,customer_no);
		//requirment
		ArrayList<Requirements> rlist = new SaleService().selectsaleRequirementsList(orders_no, customer_no);
		//작가의 썸네일
		Files f = new SaleService().selectProfile(board_no);
		//판매글 번호도 필요해요
		//member_no로 닉네임까지만 가져오기
		String page = "";
		if(b!=null && rlist != null && f != null){
			page = "views/sale/paymentpage.jsp";
			request.setAttribute("b", b);
			request.setAttribute("rlist", rlist);
			request.setAttribute("f", f);
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
