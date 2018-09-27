package com.comvision.artBridge.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.nBoard.model.service.NBoardService;


@WebServlet("/selectPostulat.ad")
public class SelectPostulatAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPostulatAdmin() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String num = request.getParameter("num");
		
		
		Member m = new AdminService().selectPostulat(num);
		
		
		String page = "";
		if(m != null){
			page = "views/notice/writerPostulatAdmin.jsp";
			request.setAttribute("m", m);
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
