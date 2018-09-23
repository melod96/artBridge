package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.Rating;

/**
 * Servlet implementation class InsertRatingServlet
 */
@WebServlet("/insertRating.ad")
public class InsertRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int insertNum = Integer.parseInt(request.getParameter("insertNum"));
		
		System.out.println(insertNum);
		
		String aa = request.getParameter("new_rating_name1");
		System.out.println(aa);
	
		ArrayList<Rating> list = new ArrayList<Rating>();
		
		for(int i = 0; i < insertNum; i++){
			Rating r = new Rating();
			if(request.getParameter("new_rating_name" + i) != null){
				r.setRating_name(request.getParameter("new_rating_name" + i));
			}
			if(request.getParameter("new_rating_slot" + i) != null && request.getParameter("new_rating_slot" + i) != ""){
				r.setSlot(Integer.parseInt(request.getParameter("new_rating_slot" + i)));
			}
			if(request.getParameter("new_rating_commission" + i) != null && request.getParameter("new_rating_commission" + i) != ""){
				r.setCommission(Integer.parseInt(request.getParameter("new_rating_commission" + i)));
			}
			if(r.getRating_name().length() > 0 && r.getRating_name() != null){
				list.add(r);
			}
		}
		
		System.out.println(list);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
