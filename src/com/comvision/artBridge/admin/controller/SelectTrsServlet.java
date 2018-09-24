package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.Messaging.SyncScopeHelper;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.transaction.model.vo.Transaction;

@WebServlet("/selectTrs.ad")
public class SelectTrsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SelectTrsServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//거래내역 전체조회
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

		//게시글 전체 출력
		ArrayList<Transaction> list = new AdminService().selectTrs(currentPage, limit);
		System.out.println(list);
		
		String page = "";
		int num = 1;
		if(list != null){
			page = "views/transaction/transactionAdmin.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("pageName", request.getParameter("pageName"));
			request.setAttribute("num", num);
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