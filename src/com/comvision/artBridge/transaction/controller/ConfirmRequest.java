package com.comvision.artBridge.transaction.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.member.model.vo.Member;


/**
 * Servlet implementation class InsertConfirmRequest
 */
@WebServlet("/confirmReq.ts")
public class ConfirmRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨펌 받으려고 서블릿 왔엉");

		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
//		String oNo = request.getParameter("ordersNo");
		System.out.println(request.getParameter("orders_no"));
		System.out.println(request.getAttribute("ordersNo"));
		System.out.println(request.getParameter("activityNo"));
		System.out.println(request.getAttribute("activityNo"));
//		String actNo = request.getParameter("activityNo");
//		System.out.println(actNo);
//		int ordersNo = Integer.parseInt((request.getParameterValues("ordersNo"));
//		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		
//		System.out.println( mNo + ", "+ oNo  + ", " + actNo);
		
		
		
//		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
//		int odActivity = Integer.parseInt(request.getAttribute(arg0))
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
