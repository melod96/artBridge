package com.comvision.artBridge.sale.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.fav.model.vo.Fav;
import com.comvision.artBridge.sale.model.service.SaleService;


/**
 * Servlet implementation class FavUpdateServlet
 */
@WebServlet("/favUpdate.sp")
public class FavUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_no = Integer.parseInt(request.getParameter("member_noo"));
		int writer_no = Integer.parseInt(request.getParameter("writer_noo"));
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("???");

		//관심작가 존재 유무 확인
		Fav selectfavlist = new SaleService().selectFavList(member_no, writer_no);
		System.out.println("--"+selectfavlist);

		int insertfavupdate = 0;
		int deletefavupdate =0;
		if(selectfavlist == null){
			insertfavupdate = new SaleService().insertFavUpdate(member_no, writer_no);
		}else{
			deletefavupdate = new SaleService().deleteFavUpdate(member_no, writer_no);
		}

		String page = null;

		if(insertfavupdate >0 ||deletefavupdate>0){
			page = "selectOneSalepage.bo?num="+num;
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
