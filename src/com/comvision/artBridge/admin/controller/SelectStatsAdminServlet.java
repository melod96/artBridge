package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.AdminService;

/**
 * Servlet implementation class SelectStatsAdminServlet
 */
@WebServlet("/selectStatsList.ad")
public class SelectStatsAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStatsAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int[] memberCounts = new int[3];
		
		memberCounts = new AdminService().selectMemberCounts();
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		
		String[] times = new String[5];
		month++;
		for(int i = 0; i < times.length; i++){
			if(month < 0){
				month = 12;
				year--;
			}
			if(month < 10){
				times[i] = year + "-0" + (month--) + "-01";
			} else {
				times[i] = year + "-" + (month--) + "-01";
			}
		}
		
		int[] orderCounts = new int[4];
		
		orderCounts = new AdminService().selectOrderCounts(times);
		
		String page = "";
		if(memberCounts.length > 0 && orderCounts.length > 0){
			page = "views/admin/statsAdmin.jsp";
			request.setAttribute("memberCounts", memberCounts);
			request.setAttribute("orderCounts", orderCounts);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "통계 조회 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
