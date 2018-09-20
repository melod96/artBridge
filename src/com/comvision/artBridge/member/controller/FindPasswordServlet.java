package com.comvision.artBridge.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.service.MemberService;

/**
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/findPassword.me")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("findUserId");
		String name = request.getParameter("findUserName");
		String email = request.getParameter("findEmail");
		int member_no = 0;
		
		member_no = new MemberService().findPassword(id, name, email);
		
		if(member_no > 0){
			request.setAttribute("member_no", member_no);
			request.getRequestDispatcher("views/member/changePasswordForm.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "아이디 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
