package com.comvision.artBridge.sale.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.sale.model.service.SaleService;

/**
 * Servlet implementation class DetailedListCommentUpdateServlet
 */
@WebServlet("/writercommentupdate.pg")
public class DetailedListCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailedListCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pricelist = request.getParameter("pricelist");
		String commentlist = request.getParameter("commentlist");
		String contentlist = request.getParameter("contentlist");
		int orderno = Integer.parseInt(request.getParameter("orderno"));
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();

		String[] price = pricelist.split("@");
		String[] comment = commentlist.split("@");
		String[] content = contentlist.split("@");
		System.out.println(contentlist);
		int update = 0;
		int insertcomment = 0;
		for(int i = 0; i<comment.length;i++){
			System.out.println(content[i]);
			update = new SaleService().updateprice(orderno, mNo, price[i],content[i]);
			insertcomment = new SaleService().insertComment(orderno, comment[i]);
		}
		String page= "";
		if(update>0 && insertcomment>0){
			page = "/selectTransList.ts";
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "작가코멘트 작성 실패");
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
