package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;

@WebServlet("/deleteSale.ad")
public class UpdateSaleInsertServlet extends HttpServlet {
       
	private static final long serialVersionUID = 4410622727618731515L;

	public UpdateSaleInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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


				int listCount = new BoardService().getListCount();


				maxPage = (int)((double)listCount/limit + 0.9);


				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


				endPage = startPage + limit -1;

				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
			
				ArrayList<Board> list = new BoardService().selectSaleList(currentPage, limit);
				
		String page = "";
		int num = 1;
		
		String str = request.getParameter("str");
		String[] arr = str.split(",");
		
		for(int i = 0; i < arr.length ; i ++){
			int b = new AdminService().updateMainView(arr[i]);
		}
		
		
		String page1 = "";

		if(list != null){
			page1 = "views/admin/mainAdmin.jsp";

			request.setAttribute("list", list);
			request.setAttribute("pi", pi);

		}else{
			page1 = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page1);
		view.forward(request, response);
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
