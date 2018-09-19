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
import com.comvision.artBridge.relate.model.vo.Relate;


@WebServlet("/selectRelate.ad")
public class SelectRelateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectRelateServlet() {
        super();
  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//연관검색어 출력
				ArrayList<Relate> list = new AdminService().selectRelate();
				
				String page = "";

				if(list != null){
					page = "views/admin/commissionAdmin.jsp";
					request.setAttribute("list", list);

				}else{
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패");
				}
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
