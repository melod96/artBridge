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

@WebServlet("/FreeBoardDetail.fb")
public class SelectFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectFreeBoardServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		//System.out.println(num);
		
		FreeBoard f = new FreeBoardService().selectOne(num);
		
		String page = "";
		if(f != null){
			page = "views/FreeBoard/freeBoardDetail.jsp";
			request.setAttribute("f", f);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
