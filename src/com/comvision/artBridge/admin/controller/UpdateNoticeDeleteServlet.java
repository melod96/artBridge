package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;

@WebServlet("/deleteNotice.no")
public class UpdateNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//삭제할 게시물의 고유 넘버를 가져옴(체크박스 체크한 만큼을 배열로 가져옴)
		String[] contCheck = request.getParameterValues("contCheck"); 
		
		ArrayList<Notice> list = new NoticeService().delNotice(contCheck);
		
		String page = "";
		if(list != null){
			page = "selectNoticeList.no";
			request.setAttribute("list", list);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
