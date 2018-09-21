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
 * Servlet implementation class DeleteMemberRequestServlet
 */
@WebServlet("/deleteRequest.me")
public class DeleteMemberRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		int result = new MemberService().deleteMemberRequest(mNo);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/logout.me");
		}else{
			request.setAttribute("msg", "회원 탈퇴 실패!");
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
