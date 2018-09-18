package com.comvision.artBridge.sale.controller;

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
import com.comvision.artBridge.sale.model.service.SaleService;



/**
 * Servlet implementation class SelectOneSalepageServlet
 */
@WebServlet("/selectOneSalepage.bo")
public class SelectOneSalepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneSalepageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		Board b =new SaleService().selectBoardOneSalepage(num);
		//해당하는 판매글의 옵션
		ArrayList<HashMap<String, Object>> oplist = new SaleService().selectOptionList(num);
		
		//한 게시글 마다 해당하는 이미지 파일 불러오기
		ArrayList<Files> flist = new SaleService().selectFileList(num);
		//Options,Files
		
		String page = null;
		
		if(b!=null){
			page = "views/sale/saleDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("oplist", oplist);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패");
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