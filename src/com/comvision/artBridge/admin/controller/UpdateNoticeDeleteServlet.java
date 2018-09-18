package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteNotice.no")
public class UpdateNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String num = request.getParameter("contCheck");
		
		String[] contCheck = request.getParameterValues("contCheck");
		
		System.out.println(contCheck);
		
		
		/*String[] intrest = request.getParameterValues("intrest");
		String intrests ="";
		
		if(intrest != null){
			for(int i = 0; i < intrest.length; i++){
				if(i == 0){
					intrests += intrest[i];
				}else{
					intrests += ", " + intrest[i];
				}
			}
		}*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
