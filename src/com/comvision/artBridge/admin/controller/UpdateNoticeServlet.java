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

@WebServlet("/updateNotice.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("수정하기로 넘어감??");
		
		String title = request.getParameter("tit");
		String content = request.getParameter("cont");
		
		
		System.out.println("제목이냐 " + title);
		System.out.println("컨텐츠 " + content);
		
		/*Notice n = new Notice();
		n.setnTitle(title);
		n.setnContent(content);
		System.out.println(n);*/
		
		//Notice result = new NoticeService().updateOne(n);
		
		/*String page = "";
		if(n != null){
			page = "views/admin/noticeUpdateForm.jsp";
			request.setAttribute("n", n);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정 실패!");
		}*/
		/*RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
