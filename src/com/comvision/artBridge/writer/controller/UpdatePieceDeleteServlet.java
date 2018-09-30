package com.comvision.artBridge.writer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
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

		int listCount = new WriterService().getListCount(memberNo);

		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 
		
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
		//해당 작가의 작품만을 보여주기위해 회원 번호를 가져옴
		//int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		//System.out.println(memberNo);
		
		//삭제할 게시물의 고유 넘버를 가져옴
		int pieceNo = Integer.parseInt(request.getParameter("pieceNo"));
		//System.out.println(pieceNo);
		
		ArrayList<HashMap<String, Object>> list = new WriterService().deletePiece(pieceNo, currentPage, limit, memberNo);
		
		String page = "";
		if(list != null){
			response.sendRedirect("/artBridge/selectPieceList.wr?memberNo=" + memberNo);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "작품 삭제 실패!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
