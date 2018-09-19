package com.comvision.artBridge.admin.controller;

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

@WebServlet("/searchNotice.no")
public class SelectSearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		System.out.println(search);
				
		/*ArrayList<Notice> list = new NoticeService().searchNotice(search);
		 
		String page = "";
		if(list != null){
			page = "/views/admin/noticeList.jsp";
			request.setAttribute("list", new NoticeService().searchNotice(search));
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 검색 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
