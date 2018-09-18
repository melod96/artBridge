package com.comvision.artBridge.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.service.MemberService;
import com.comvision.artBridge.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userId = request.getParameter("joinUserId");
		String userPwd = request.getParameter("joinUserPwd");
		String userName = request.getParameter("joinUserName");
		String nick_name = request.getParameter("nickName");
		String phone = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setId(userId);
		m.setPassword(userPwd);
		m.setName(userName);
		m.setNick_name(nick_name);
		m.setPhone(phone);
		m.setEmail(email);
		
		int result = new MemberService().insertMember(m);
		
		String Page = "";
		if(result > 0){
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("msg", "회원가입 실패!");
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
