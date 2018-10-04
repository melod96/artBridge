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
import com.comvision.artBridge.sale.model.service.SaleService;


@WebServlet("/updatePostulat.ad")
public class UpdatePostulatInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdatePostulatInsertServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String approval_content = request.getParameter("approval_content"); 
		int member_no = Integer.parseInt(request.getParameter("member_no"));
		int pos = 0;
		if(request.getParameter("pos") != null){
			pos = Integer.parseInt(request.getParameter("pos")); //체크박스 승인
		}

		System.out.println(approval_content);
		System.out.println(member_no);
		System.out.println(pos);
		
		
		int result = new AdminService().updateInsertPostulat(approval_content, member_no, pos);
		String page = "";
		
		if(result > 0){
			response.sendRedirect("/artBridge/selectMemberList.ad?pageName=memberAdmin");
		}else{
			response.sendRedirect("/artBridge/selectMemberList.ad?pageName=memberAdmin");
		}
		
		
	/*	ArrayList<Board> list = new BoardService().selectSaleList(currentPage, limit);
		
		String page = "";
		int num = 1;
		
		String str = request.getParameter("str");
		String[] arr = str.split(",");
		
		for(int i = 0; i < arr.length ; i ++){
			int b = new AdminService().updateMainView(arr[i]);
		}
		
		
		String page1 = "";

		if(list != null){
			page1 = "views/admin/mainAdmin.jsp";
			request.setAttribute("num", num);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);

		}else{
			page1 = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page1);
		view.forward(request, response);
		*/
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
