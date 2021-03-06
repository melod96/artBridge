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
import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;

@WebServlet("/deleteMain.ad")
public class UpdateSaleDeleteServlet extends HttpServlet {
       

	private static final long serialVersionUID = -4873681438181026613L;

	public UpdateSaleDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String str = request.getParameter("str");
		String[] arr = str.split(",");
		int result = 0;
		
		for (int i = 0; i < arr.length; i++) {
			result += new AdminService().updateMainDelete(arr[i]);
		}

		String page = "";

		if (result == arr.length) {
			response.sendRedirect("/artBridge/selectMain.ad");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패실패!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
