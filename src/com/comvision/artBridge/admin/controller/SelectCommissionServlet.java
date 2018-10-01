package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.Board;
import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.admin.model.vo.Relate;


@WebServlet("/selectCommision.ad")
public class SelectCommissionServlet extends HttpServlet {
       
	private static final long serialVersionUID = 1L;

	public SelectCommissionServlet() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색조건
		String value = null;
		String[] arr = new String[2];
		String kind = null;
		String keyword = null;
		if(request.getParameter("value") != null && request.getParameter("value").length() > 0){
			value = request.getParameter("value");
			arr = value.split(",");
			kind = arr[0];
			keyword = arr[1];
		}
				
		String addQuery = "";
		if(kind != null && kind.length() > 0){
			if(kind.equals("BOARD_NO")){
				addQuery = " and " + kind + " = " + keyword + " ";
			}else if(kind.equals("NICK_NAME")){
				addQuery = " and m." + kind + " like '%' || '" + keyword + "' || '%' ";
			}else if(kind.equals("BOARD_TITLE")){
				addQuery = " and " + kind + " like '%' || '" + keyword + "' || '%' ";
			}
		}
		
		//페이징 처리
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
				
		currentPage = 1;
		
		limit = 5;
		
		if(request.getParameter("currentPage")!= null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = new AdminService().getSaleListCount(addQuery);
		
		maxPage = (int)((double)listCount/limit + 0.9);

		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 

		endPage = startPage + limit -1;

		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
			
		//출력
		ArrayList<Relate> relateList = new AdminService().selectRelate();
		ArrayList<Board> boardList = new AdminService().selectBoardList(currentPage, limit, addQuery);
				
		String page = "";
		if(relateList != null && boardList != null){
			page = "views/admin/commissionAdmin.jsp";
			request.setAttribute("relateList", relateList);
			request.setAttribute("boardList", boardList);
			request.setAttribute("pi", pi);
			request.setAttribute("pageName", "commissionAdmin");
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
