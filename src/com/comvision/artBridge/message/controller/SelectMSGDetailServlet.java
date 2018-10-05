package com.comvision.artBridge.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;

@WebServlet("/selectDetail.msg")
public class SelectMSGDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMSGDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int msg_no = Integer.parseInt((String)request.getParameter("msg_no"));
		
		Message m = new MessageService().SelectOneMSG(msg_no);
		
		
		String page = "";
		if( m != null){
			page = "/views/admin/customerQna.jsp";
			request.setAttribute("m", m);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", " 답변 작성페이지 로드 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
		
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
