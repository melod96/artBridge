package com.comvision.artBridge.nBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.nBoard.model.service.NBoardService;

@WebServlet("/selectDetail.nb")
public class SelectNBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNBoardDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String num = request.getParameter("num");
		
		
		Notice n = new NBoardService().selectOne(num);
		
		
		String page = "";
		if(n != null){
			page = "views/notice/noticeBoardDetail.jsp";
			request.setAttribute("n", n);
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
