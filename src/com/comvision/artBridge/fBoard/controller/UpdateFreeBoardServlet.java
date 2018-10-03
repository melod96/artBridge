package com.comvision.artBridge.fBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.fBoard.model.service.FreeBoardService;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;


@WebServlet("/updateFree.fb")
public class UpdateFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateFreeBoardServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		System.out.println(board_title + ", " + board_content);
		
		FreeBoard f = new FreeBoard();
		f.setBoard_no(num);
		f.setBoard_title(board_title);
		f.setBoard_content(board_content);
		
		String page = "";
		if(f!=null){
			page = "views/fBoard/freeBoardUpdateForm.jsp";
			request.setAttribute("num", num);
			request.setAttribute("board_title", board_title);
			request.setAttribute("board_content", board_content);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "자유게시판 수정 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
