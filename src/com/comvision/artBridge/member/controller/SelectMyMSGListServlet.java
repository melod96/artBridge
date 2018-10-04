package com.comvision.artBridge.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.PageInfo;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;
import com.google.gson.Gson;

@WebServlet("/selectMyMsgList.msg")
public class SelectMyMSGListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public SelectMyMSGListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		System.out.println(mNo);
		
/*		int num = 1;
		// 페이징 처리
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		limit = 10;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = new MessageService().getMyListCount(addQuery);

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		*/
		
		//메세지 리스트 출력
//		ArrayList<Message> mlist = new MessageService().mySelectList(currentPage, limit, addQuery, memberNo);
		ArrayList<Message> msgList = new MessageService().selectMyMsgList(mNo);
		
		String page = "";
		
		if(msgList != null){
			page = "views/myPage/myPageForm.jsp?pageName=msg-menu";
			request.setAttribute("msgList", msgList);
			
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
