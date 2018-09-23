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
 * Servlet implementation class DeleteMemberStatusCheck
 */
@WebServlet("/memberDelCheck.me")
public class DeleteAbleMemberCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAbleMemberCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		int result = new MemberService().deleteAbleChceck(mNo);
		
		if(result > 0){
			response.getWriter().print(result);
		}else{
//			response.sendRedirect(request.getContextPath() + "/deleteRequest.me");
			DeleteMemberRequestServlet dmrs = new DeleteMemberRequestServlet();
			dmrs.doPost(request, response);
			
			/* ajax이기 때문에 바로 메인페이지 호출 불가능(다시 서블릿을 호출한 곳으로 돌아갈 수 밖에 없음 -> jsp파일에 최종 뷰 처리 해주면 돼~)*/
			response.getWriter().print(result);
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
