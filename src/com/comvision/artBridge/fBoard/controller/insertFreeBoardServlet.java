package com.comvision.artBridge.fBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.fBoard.model.service.FreeBoardService;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;
import com.comvision.artBridge.member.model.vo.Member;


@WebServlet("/insertFree.fb")
public class insertFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public insertFreeBoardServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		
		System.out.println(board_content);
		
		FreeBoard f = new FreeBoard();
		f.setBoard_title(board_title);
		f.setBoard_content(board_content);
		f.setMember_no(mNo);
		
		int result = new FreeBoardService().insertFreeBoard(f);
		
		String page = "";
		if(result > 0){
			page = "selectFreeBoardList.fb";
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "자유게시판 등록 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
