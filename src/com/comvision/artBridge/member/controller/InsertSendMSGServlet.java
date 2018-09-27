package com.comvision.artBridge.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;

@WebServlet("/insertSend.msg")
public class InsertSendMSGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertSendMSGServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mem_id = Integer.parseInt((String)request.getParameter("mem_id"));
		
		Message m = new MessageService().SelectOneMSG(mem_id);
		
		
		String page = "";
		if( m != null){
			page = "/views/myPage/sendMessageForm.jsp";
			request.setAttribute("m", m);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 전송 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
