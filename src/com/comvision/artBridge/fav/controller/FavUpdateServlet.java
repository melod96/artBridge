package com.comvision.artBridge.fav.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.fav.model.vo.Fav;
import com.comvision.artBridge.member.model.vo.Member;
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
		int member_no = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		int writer_no = Integer.parseInt(request.getParameter("writer_noo"));
		
		int num = 0;
		if(request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
		}

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



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
