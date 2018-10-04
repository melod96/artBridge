package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;


@WebServlet("/selectPostulat.ad")
public class SelectPostulatAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPostulatAdmin() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int num = Integer.parseInt(request.getParameter("member_no"));
		
		Member m = new AdminService().selectPostulat(num);
		System.out.println(m);
		ArrayList<Files> flist = new AdminService().selectFilelist(num);
		
		
		String page = "";
		if(m != null){
			page = "views/admin/writerPostulatAdmin.jsp";
			request.setAttribute("list", m);
			request.setAttribute("flist", flist);
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
