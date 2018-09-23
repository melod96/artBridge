package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;
import com.comvision.artBridge.admin.model.vo.Rating;

/**
 * Servlet implementation class UpdateRatingServlet
 */
@WebServlet("/updateRating.ad")
public class UpdateRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.parseInt(request.getParameter("no"));
		String rating_name = request.getParameter("rating_name");
		int rating_slot = Integer.parseInt(request.getParameter("rating_slot"));
		int rating_commission = Integer.parseInt(request.getParameter("rating_commission"));
		
		Rating r = new Rating(no, rating_name, rating_slot, rating_commission);
	
		int result = new AdminService().updateRating(r);

		if(result > 0){
			response.getWriter().print(no);
		}else{
			request.setAttribute("msg", "등급 업데이트 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
