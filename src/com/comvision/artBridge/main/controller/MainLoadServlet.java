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
		
		
		/*	for(Files f : flist){
			System.out.println(f.getChange_title());
		}*/
		
		//중 상단 베스트 작가
		ArrayList<Files> bestWriterList = new MainService().mainLoad2();
		
		/*for(Files f : bestWriterList){
			System.out.println(f.getChange_title());
		}*/
		
		
		//중 하단 최신 글
		ArrayList<Files> newList = new MainService().mainLoad3();
		
		
		//하단 좌측 공지사항
		ArrayList<Notice> noticeList = new MainService().searchNoticeList();
		
		
		
		String page ="";
		
		
		if(slidelist != null){
			page = "/views/main/main2.jsp";
			request.setAttribute("slidelist", slidelist);
			
			
			if(bestWriterList != null){
				request.setAttribute("bestWriterList", bestWriterList);
			}
			
			if(bestWriterList != null){
				request.setAttribute("newList", newList);
			}
			
			if(noticeList != null){
				request.setAttribute("noticeList", noticeList);
			}
			
			
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 검색 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
