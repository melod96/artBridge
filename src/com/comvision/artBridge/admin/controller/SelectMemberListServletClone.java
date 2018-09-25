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
		
		//페이징처리
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
		
		
		//검색옵션
		String searchCondition = request.getParameter("searchCondition");
		String searchWords = request.getParameter("searchWords");
		String userDivision = request.getParameter("userDivision");
		String writerGrade = request.getParameter("writerGrade");
		
		String addQuery = "";
		
		if(searchWords != null){
			if(searchCondition != null){
				switch(searchCondition){
				case "name" : addQuery += "and m.name like '%' || '" + searchWords + "' || '%' "; break;
				case "id" : addQuery += "and m.id like '%' || '" + searchWords + "' || '%'"; break; 
				case "phone" : addQuery += "and m.phone like '%' || '" + searchWords + "' || '%' "; break; 
				case "email" : addQuery += "and m.email like '%' || '" + searchWords + "' || '%' "; break;
				}
			}
			if(userDivision != null){
				switch(userDivision){
				case "writer" : addQuery += "and m.writer_right = 1 "; 
								if(writerGrade != null){
									switch(writerGrade){
									case "1" : addQuery += "and m.rating_no = 1 "; break;
									case "2" : addQuery += "and m.rating_no = 2 "; break;
									case "3" : addQuery += "and m.rating_no = 3 "; break;
									case "4" : addQuery += "and m.rating_no = 4 "; break;
									}
								}
								break;
				case "nomal" : addQuery += "and m.writer_right = 0 "; writerGrade = "0"; break;
				}
			}
			if(writerGrade != null){
				switch(writerGrade){
				case "1" : addQuery += "and m.rating_no = 1 "; break;
				case "2" : addQuery += "and m.rating_no = 2 "; break;
				case "3" : addQuery += "and m.rating_no = 3 "; break;
				case "4" : addQuery += "and m.rating_no = 4 "; break;
				}
			}
		}
		
		System.out.println("추가되는 Query : " + addQuery);

		ArrayList<Member> list = new AdminServiceClone().selectList(currentPage, limit, addQuery);
		
		String page = "";
		if(list != null){
			page = "views/admin/memberAdminClone.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("searchWords", searchWords);
			request.setAttribute("userDivision", userDivision);
			request.setAttribute("writerGrade", writerGrade);
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
