package com.comvision.artBridge.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;


@WebServlet("/insertRelate.ad")
public class InsertRelateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertRelateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String relate_name = request.getParameter("relate_name");
		
		int result = new AdminService().insertRelate(relate_name);
		
		if(result > 0){
			response.sendRedirect("/artBridge/selectCommision.ad");
		}else{
			request.setAttribute("msg", "연관검색어 추가 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
