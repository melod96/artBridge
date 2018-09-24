package com.comvision.artBridge.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;

@WebServlet("/selectList.no")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("서블릿 진입");
		
		ArrayList<Board> list = new BoardService().selecNoticetList();
		System.out.println("servlet");
		
		String page = "";
		
		if(list != null){
			page = "views/main/main.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
