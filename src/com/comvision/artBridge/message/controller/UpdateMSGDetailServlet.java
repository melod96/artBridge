package com.comvision.artBridge.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;

@WebServlet("/updateDetail.msg")
public class UpdateMSGDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMSGDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			//옵션 1 : 답변상태
				String sel1 = null;
				String option = "";
				
				System.out.println("req : "+ request.getParameter("sel1"));	
				
				if(request.getParameter("sel1") != null){
					sel1 = request.getParameter("sel1");
					System.out.println("sel1");
					switch(sel1){
					case "sel1Op1" : option = "null";break;
					case "sel1Op2" : option = "sysdate";break;
					}
				}
		
				System.out.println("option : " + option);
			//title, content
				String title = "";
				String content = "";
				
				if(request.getParameter("title") != null){
					title = request.getParameter("title");
				}
				
				if(request.getParameter("content") != null){
					content = request.getParameter("content");
				}
		
				System.out.println("title : " + title);
				System.out.println("content : " + content);
				
				
			//msgNo
				String msgNo = request.getParameter("msgNo");
				System.out.println("msgNo : " + msgNo);
		
			
		//질문의 답변 상태를 업데이트
		int result = new MessageService().updateMSG(msgNo, option);
		
		//답변을 새로운 메세지로 인서트
		int result2 = new MessageService().insertMSGTo(title, content, msgNo);
		
		String page = "";
		if(result > 0 && result2 > 0){
			page = "/views/message/selectList.msg?pageName=customerAdmin";
			
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "업뎃 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
