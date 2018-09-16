package com.comvision.artBridge.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.service.BoardService;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;

/**
 * Servlet implementation class SelectKeywordList
 */
@WebServlet("/searchkeyword.bo")
public class SearchKeywordList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchKeywordList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String search = request.getParameter("search");
		

				ArrayList<Board> list = new BoardService().searchKeywordList(search);
				
				System.out.println("검색결과 : " + list);
				
				//한 게시글 마다 해당하는 이미지 파일 불러오기
				HashMap<String, Object> hmap = new BoardService().selectFileList(list);
				
				Board b = (Board)hmap.get("board");
				ArrayList<Files> filelist = (ArrayList<Files>)hmap.get("files");

				//연관 검색어 출력
				ArrayList<Relate> rlist = new BoardService().selectRelateList();
				String page = "";

				if(list != null){
					page = "views/sale/salepage.jsp";
					request.setAttribute("list", list);
					request.setAttribute("filelist", filelist);
					request.setAttribute("rlist", rlist);
				}else{
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패");
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
