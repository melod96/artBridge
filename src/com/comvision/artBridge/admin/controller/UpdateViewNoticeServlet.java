package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;

import sun.util.locale.StringTokenIterator;

@WebServlet("/updateViewNotice.no")
public class UpdateViewNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateViewNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");

	    Notice n = new NoticeService().selectOne(num);
		
		String page = "";
		if(n != null){
			page = "views/admin/noticeUpdateForm.jsp";
			request.setAttribute("n", n);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
