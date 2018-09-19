package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminServiceClone;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.member.model.vo.Member;

/**
 * Servlet implementation class SelectMemberListServlet
 */
@WebServlet("/selectMemberListClone.ad")
public class SelectMemberListServletClone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberListServletClone() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;		
		int limit;				
		int maxPage; 			
		int startPage; 			
		int endPage;			
	
		currentPage = 1;
		limit = 10;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new AdminServiceClone().getListCount();
		maxPage = (int)((double)listCount / limit + 0.99);
		startPage = (((int)((double)currentPage / limit + 0.99)) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
				
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<Member> list = new AdminServiceClone().selectList(currentPage, limit);
		
		String page = "";
		if(list != null){
			page = "views/admin/memberAdminClone.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 조회 실패");
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
