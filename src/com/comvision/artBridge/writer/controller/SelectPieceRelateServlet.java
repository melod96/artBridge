package com.comvision.artBridge.writer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.writer.model.service.WriterService;

@WebServlet("/InsertPieceForm.wr")
public class SelectPieceRelateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPieceRelateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//작가 작품등록 폼에서 연관검색어 노출
		ArrayList<Relate> relate = new WriterService().relateWord();
		System.out.println(relate);
		
		String page = "";
		if(relate != null){
			page = "/views/myPage/writerPieceInsertForm.jsp";
			request.setAttribute("relate", relate);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "연관검색어 불러오기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
