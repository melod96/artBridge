package com.comvision.artBridge.writer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.writer.model.service.WriterService;

@WebServlet("/updatePieceView.wr")
public class UpdatePieceViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePieceViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pieceNo = Integer.parseInt(request.getParameter("pieceNo"));
		
		/*Board board = new WriterService().updatePieceOne(pieceNo);
		
		String page = "";
		if(board != null){
			page = "selectPieceList.wr";
			request.setAttribute("Board", board);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "작품 수정보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
