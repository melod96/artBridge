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
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		String userId = request.getParameter("myPageUserId");		
		String userPwd = request.getParameter("myPageUserPwd");

		String userName = request.getParameter("myPageUserName");		
		String nickName = request.getParameter("myPageNickName");
		String phone = "";
		for(int i = 1; i <= 3; i++){
			phone += request.getParameter("tel" + i);
		}		
		String email = request.getParameter("email");		
		
		Member m = new Member();
		m.setMember_no(mNo);
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
//			href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu"
			response.sendRedirect("/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu");
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
