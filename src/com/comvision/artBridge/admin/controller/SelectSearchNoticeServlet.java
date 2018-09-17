package com.comvision.artBridge.admin.controller;

import java.io.IOException;
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
		
		//Notice n = new NoticeService().searchNotice(search);
		 
		//request.setAttribute("n", n);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
