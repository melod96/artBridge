package com.comvision.artBridge.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.main.model.service.MainService;
import com.google.gson.Gson;

@WebServlet("/ContentLoad.main")
public class MainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainLoadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//맨 위 베스트
		ArrayList<Files> slidelist = new MainService().mainLoad();
		System.out.println("1 : " + slidelist.size());
		
		//중 상단 베스트 작가
		ArrayList<Files> bestWriterList = new MainService().mainLoad2();
		System.out.println("2 : " + bestWriterList.size());
		
		//중 하단 최신 글
		ArrayList<Files> newList = new MainService().mainLoad3();
		System.out.println("3 : " + newList.size());
		
		//하단 좌측 공지사항
		ArrayList<Notice> noticeList = new MainService().searchNoticeList();
		System.out.println("4 : " + noticeList.size());
		
		String page ="";
		
		
		
			if(slidelist != null){
				request.setAttribute("slidelist", slidelist);
			}
			
			if(bestWriterList != null){
				request.setAttribute("newList", newList);
			}
			
			if(bestWriterList != null){
				request.setAttribute("bestWriterList", bestWriterList);
			}
			
			if(noticeList != null){
				request.setAttribute("noticeList", noticeList);
			}
		
		
		page = "/views/main/main2.jsp";
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
