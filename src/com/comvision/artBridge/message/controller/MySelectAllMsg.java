package com.comvision.artBridge.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;
import com.google.gson.Gson;

@WebServlet("/selectMsgAll.my")
public class MySelectAllMsg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public MySelectAllMsg() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		System.out.println(mNo);

		ArrayList<Message> msgList = new MessageService().selectMyMsgList(mNo);
		
		String page = "";
		
		if(msgList != null){
			page = "views/myPage/myPageForm.jsp?pageName=msg-menu";
			request.setAttribute("msgList", msgList);
			System.out.println("메시지 리스트야 : " + request.getAttribute("msgList"));
			/*request.setAttribute("pi", pi);
			request.setAttribute("num", num);*/
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
//			new Gson().toJson(msgList, response.getWriter());
			response.getWriter().print(new Gson().toJson(msgList));
			System.out.println("gson이야 : " + new Gson().toJson(msgList));
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "에러러ㅓ러ㅓ러!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
