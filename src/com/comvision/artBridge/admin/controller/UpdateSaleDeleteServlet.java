package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteSale.ad")
public class UpdateSaleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateSaleDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("str");
		String[] arr = str.split(",");
		
		for(int i = 0; i < arr.length ; i ++){
			
		}
		
		
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
