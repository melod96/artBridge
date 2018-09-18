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
 * Servlet implementation class UpdateMemberInfoServlet
 */
@WebServlet("/updateInfo.me")
public class UpdateMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");		
		String userPwd = request.getParameter("userPwd1");		
		String userName = request.getParameter("userName");		
		String nickName = request.getParameter("nickName");
		String phone = "";
		for(int i = 1; i <= 3; i++){
			phone += request.getParameter("tel" + i);
		}		
		String email = request.getParameter("email");		
		
		Member m = new Member();
		m.setId(userId);
		m.setPassword(userPwd);
		m.setName(userName);
		m.setNick_name(nickName);
		m.setPhone(phone);
		m.setEmail(email);
		
		int result = new MemberService().updateMember(m);
		
		String Page = "";
		if(result > 0){
//			location.href="<%=request.getContextPath()%>/index.jsp";
			response.sendRedirect("/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu");/*href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu"*/
		}else{
			request.setAttribute("msg", "회원 정보 수정 실패!");
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
