package com.comvision.artBridge.writer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.writer.model.service.WriterService;

@WebServlet("/selectPieceList.wr")
public class SelectPieceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPieceListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//해당 작가의 작품만을 보여주기위해 회원 번호를 가져옴
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		//페이징 처리
		int currentPage;
		int limit;		
		int maxPage; 	
		int startPage;	
		int endPage; 	

		currentPage = 1;
		limit = 10;

		if(request.getParameter("currentPage")!= null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = new WriterService().getListCount(memberNo);

		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit+1; 
		
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount,limit, maxPage, startPage, endPage);
		
		
		//작가 작품관리 리스트
		ArrayList<Board> list = new WriterService().selectList(currentPage, limit, memberNo);
		
		//프로필 사진 노출
		ArrayList<Files> profileFile = new WriterService().selectProfileImg(memberNo);

		//작품리스트 노출(썸네일 포함)
		/*HashMap<String, Object> hmap = new WriterService().selectThumbImg(currentPage, limit, memberNo);
		
		System.out.println(hmap);
		Board board = (Board)hmap.get("board");
		ArrayList<Files> list = (ArrayList<Files>)hmap.get("files"); */
		
		//작가 별점 노출
		int writerAvg = new WriterService().selectWriterAvg(memberNo);

		String page = "";
		if(list != null){
			page = "/views/myPage/writerPieceManagement.jsp";
			request.setAttribute("profileFile", profileFile);
			request.setAttribute("writerAvg", writerAvg);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "작품관리 보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
