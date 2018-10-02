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
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.sale.model.vo.Options;
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
		ArrayList<Relate> relateCks = (ArrayList<Relate>)hmap.get("relateCk");
		
		//저장된 연관검색어 노출
		ArrayList<Relate> relateCk = new ArrayList<Relate>();
		for(int i = 0; i < relateCks.size(); i++){
			relateCk.add((Relate)relateCks.get(i)); 
		}
		//System.out.print("등록된 연관검색어 노출!" + relateCk);
		
		//default 연관검색어 노출
		ArrayList<Relate> relate = new WriterService().relateWord();
		
		//옵션 및 가격 노출
		ArrayList<Options> optionsList = new WriterService().selectOptionsList(memberNo, pieceNo);
		
		String page = "";
		if(hmap != null){
			page = "views/myPage/writerPieceUpdateForm.jsp";
			request.setAttribute("board", board);
			request.setAttribute("pieceData", pieceData);
			request.setAttribute("relateCk", relateCk);
			request.setAttribute("relate", relate);
			request.setAttribute("optionsList", optionsList);
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
