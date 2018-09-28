package com.comvision.artBridge.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.message.model.service.MessageService;
import com.comvision.artBridge.message.model.vo.Message;

@WebServlet("/responMSG.my")
public class InsertResponMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertResponMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
		
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
