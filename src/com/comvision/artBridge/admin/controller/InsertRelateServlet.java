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
import com.comvision.artBridge.relate.model.vo.Relate;


@WebServlet("/insertRelate.ad")
public class InsertRelateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertRelateServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int relate_no = Integer.parseInt(request.getParameter("relate_no"));
		String relate_name = request.getParameter("relate_name");
		System.out.println(relate_name);
		
	/*	Relate r = new Relate();
		//r.setRelate_no(relate_no);
		r.setRelate_name(relate_name);
		*/
		
	//	int result = new AdminService().insertRelate(r);
		
		
		int result = new AdminService().insertRelate(relate_name);
		
		
		String Page="";
		
		Page = "selectCommision.ad";

		
		
		RequestDispatcher view = request.getRequestDispatcher(Page);
		view.forward(request, response);
		/*if(result > 0){
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("msg", "연관검색어 추가 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
