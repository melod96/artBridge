package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.MainService;
import com.comvision.artBridge.admin.model.vo.Main;

/**
 * Servlet implementation class SelectMainServlet
 */
@WebServlet("/selectMain.ad")
public class SelectMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		System.out.println(board_no);
		
		Main mno = new Main();
		mno.setBoard_no(board_no);
		
		//int result = new MainService().selectMain(mno);
		
		/*String Page = "";
		if(result > 0){
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("msg", "회원가입 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		*/
		
		/*String userId = request.getParameter("joinUserId");
		String userPwd = request.getParameter("joinUserPwd");
		String nick_name = request.getParameter("nickName");
		String phone = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setId(userId);
		m.setPassword(userPwd);
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
		}*/
		
		
		
		/*String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		System.out.println(content);
		
		Notice n = new Notice();
		n.setnTitle(title);
		n.setnContent(content);
		
		int result = new NoticeService().insertNotice(n);
		
		String page = "";
		if(result > 0){
			page = "/views/admin/noticeList.jsp";
			request.setAttribute("list", new NoticeService().selectList());
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
