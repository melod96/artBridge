package com.comvision.artBridge.fBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.fBoard.model.service.FreeBoardService;
import com.comvision.artBridge.fBoard.model.vo.FreeBoard;

@WebServlet("/deleteFree.fb")
public class UpdateFreeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateFreeDeleteServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no = Integer.parseInt(request.getParameter("num"));
		int list = new FreeBoardService().delFreeBoard(board_no);
		
		String page = "";
		if(list > 0){
			page = "selectFreeBoardList.fb";
			//request.setAttribute("list", list);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
