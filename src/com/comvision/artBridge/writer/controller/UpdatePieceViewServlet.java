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
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.writer.model.service.WriterService;

@WebServlet("/updatePieceView.wr")
public class UpdatePieceViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePieceViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int pieceNo = Integer.parseInt(request.getParameter("pieceNo"));
		
		HashMap<String, Object> hmap = new WriterService().selectPieceData(memberNo, pieceNo);
		
		Board board = (Board)hmap.get("board");
		ArrayList<Files> pieceData = (ArrayList<Files>)hmap.get("selectThumbImg");

		System.out.println(pieceData);
		
		//저장되어있는 연관검색어 노출
		//ArrayList<Relate> relate = new WriterService().RelateWord();
		ArrayList<Relate> relate = new WriterService().selectRelateWord();
		System.out.println(relate);
		
		String page = "";
		if(hmap != null){
			page = "views/myPage/writerPieceUpdateForm.jsp";
			request.setAttribute("board", board);
			request.setAttribute("pieceData", pieceData);
			request.setAttribute("relate", relate);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "작품 수정보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
