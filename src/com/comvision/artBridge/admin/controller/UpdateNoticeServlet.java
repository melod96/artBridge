package com.comvision.artBridge.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.sun.beans.editors.IntegerEditor;

@WebServlet("/updateNotice.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//System.out.println(title + ", " + content);
		
		Notice n = new Notice();
		n.setnNo(Integer.parseInt(num));
		n.setnTitle(title);
		n.setnContent(content);
		
		int result = new NoticeService().updateNotice(n);
		
		String page = "";
		if(result > 0){
			page = "/views/admin/noticeDetail.jsp";
			request.setAttribute("n", new NoticeService().selectOne(num));
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
