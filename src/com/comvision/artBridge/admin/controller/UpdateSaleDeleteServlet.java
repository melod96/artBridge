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
public class UpdateSaleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateSaleDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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


				int listCount = new BoardService().getListCount();


				maxPage = (int)((double)listCount/limit + 0.9);


				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 


				endPage = startPage + limit -1;

				if(maxPage<endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
			
				//판매글 출력
				ArrayList<Board> list = new BoardService().selectSaleList(currentPage, limit);
				
				String page = "";
				int num = 1;
		
		String str = request.getParameter("str");
		String[] arr = str.split(",");
		
		//선택한 게시글 번호 업데이트
		for(int i = 0; i < arr.length ; i ++){
			int b = new AdminService().updateMainView(arr[i]);
		}
		
		//메인 뷰=1인거 select
		ArrayList<Board> blist = new AdminService().selectMainView();
		HashMap<String, Object> hmap = new HashMap<String,Object>();
		hmap.put("blist", blist);
		
		String page1 = "";

		if(blist != null){
			page1 = "views/admin/mainAdmin.jsp";
			request.setAttribute("blist", blist);
			request.setAttribute("hmap", hmap);

			request.setAttribute("list", list);
			request.setAttribute("pi", pi);

		}else{
			page1 = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page1);
		view.forward(request, response);
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
