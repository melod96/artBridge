package com.comvision.artBridge.transaction.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;

@WebServlet("/insertSendConfirmPic.ts")
public class InsertSendMsgConfirmPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertSendMsgConfirmPic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mem_id = request.getParameter("mem_id");
		String receive_mem_no = request.getParameter("receive_mem_no");
		String title = request.getParameter("title");
		String editor = request.getParameter("editor");
		System.out.println(request.getAttributeNames());
		
		System.out.println("mem_id :" + mem_id + ", receive_no : " + receive_mem_no + ", title : " + title + ", editor : " + editor); 
		
		int result = new MessageService().sendMSG(mem_id, receive_mem_no, title, editor);
		
		String page = "";
		if(result > 0){
			page = "/views/myPage/successSendMSG.jsp";
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
