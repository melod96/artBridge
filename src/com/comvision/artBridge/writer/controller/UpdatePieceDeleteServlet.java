package com.comvision.artBridge.writer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.writer.model.service.WriterService;

@WebServlet("/deletePiece.wr")
public class UpdatePieceDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePieceDeleteServlet() {
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
		limit = 10;

		if(request.getParameter("currentPage")!= null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = new WriterService().getListCount();

		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 
		
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
		//삭제할 게시물의 고유 넘버를 가져옴
		int pieceNo = Integer.parseInt(request.getParameter("pieceNo"));
		System.out.println(pieceNo); //jsp에서 name으로 보낸 보드넘버값이랑 여기 서블릿에서 받는 값이랑 다름..왜 다른지 모르겟음
		
		ArrayList<Board> list = new WriterService().deletePiece(pieceNo, currentPage, limit);
		
		String page = "";
		if(list != null){
			page = "selectPieceList.wr";
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "작품 삭제 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
