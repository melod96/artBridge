package com.comvision.artBridge.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.Board;

@WebServlet("/insertMain.ad")
public class InsertMainAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public InsertMainAdminServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		System.out.println(board_no);
		
		Board b = new Board();
		b.setBoard_no(board_no);
		
		int result = new AdminService().insertAdmin(b);
		
		String page = "";
		if(result > 0){
			response.sendRedirect("/artBridge/selectMain.ad");
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
