package com.comvision.artBridge.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.main.model.service.MainService;
import com.google.gson.Gson;

@WebServlet("/bestLoad")
public class MainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainLoadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<Files> flist = new MainService().mainLoad();
		
		for(Files f :flist){
			System.out.println(f.getChange_title());
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(flist, response.getWriter());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
