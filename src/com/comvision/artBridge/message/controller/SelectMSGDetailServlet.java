package com.comvision.artBridge.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.vo.Message;

@WebServlet("/selectDetail.msg")
public class SelectMSGDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMSGDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int msg_no = Integer.parseInt((String)request.getParameter("msg_no"));
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
