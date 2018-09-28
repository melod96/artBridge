package com.comvision.artBridge.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;

@WebServlet("/updateDetail.my")
public class UpdateMSGDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMSGDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
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
		
			String option = "";
		//질문의 답변 상태를 업데이트
		int result = new MessageService().updateMSG(msgNo, option);
		
		//답변을 새로운 메세지로 인서트
		String Dispatch_member_no = request.getParameter("Dispatch_member_no");
		String mem_id = request.getParameter("mem_id");
		int result2 = new MessageService().insertMyMSGTo(title, content, Dispatch_member_no, mem_id);
		
		String page = "";
		if(result > 0 && result2 > 0){
			page = "/views/myPage/successSendMSG.jsp";
			
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
