package com.comvision.artBridge.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.message.model.service.MessageService;

@WebServlet("/insertSendMsg.my")
public class MyInsertSendMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInsertSendMsg() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		String receiverNo = request.getParameter("receiverNo");
		String title = request.getParameter("title");
		String editor = request.getParameter("editor");
		System.out.println(request.getAttributeNames());
		
		System.out.println("mem_no :" + mNo + ", receive_no : " + receiverNo + ", title : " + title + ", editor : " + editor); 
		
		int result = new MessageService().sendMyMsg(mNo, receiverNo, title, editor);
		
		if(result > 0){
			response.sendRedirect("/artBridge/views/myPage/myPageForm.jsp?pageName=msg-menu");
		}else{
			request.setAttribute("msg", "메시지 전송 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
