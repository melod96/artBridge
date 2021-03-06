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
import com.comvision.artBridge.grade.model.vo.Grade;
import com.comvision.artBridge.member.model.vo.Rating;
import com.comvision.artBridge.relate.model.vo.Relate;
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
		
		Board b =new SaleService().selectBoardOneSalepage(num);
		
		//해당하는 판매글의 옵션
		ArrayList<HashMap<String, Object>> oplist = new SaleService().selectOptionList(num);
		
		//해당하는 판매글의 연관검색어
		ArrayList<Relate> rlist = new SaleService().selectRelateList(num);
		
		//한 게시글 마다 해당하는 이미지 파일 불러오기
		ArrayList<Files> flist = new SaleService().selectFileList(num);
		
		//작가 프로필 사진
		Files f = new SaleService().selectProfile(b.getMember_no());
		
		//해당하는 작가의 등급
		Rating r= new SaleService().selectRating(b.getMember_no());
		
		//해당하는 판매글의 후기
		ArrayList<Grade> glist = new SaleService().selectGradeList(num);
		
		//평균 별점
		Grade avgGrade = new SaleService().avgGrade(num);
		
		//작가지정슬롯수
		int slot = new SaleService().selectSlot(b.getMember_no());
		
		//작가의 주문수
		int orderCount = new SaleService().selectOrderCount(b.getMember_no());
		
		String page = null;
		System.out.println(b);
		System.out.println(flist);
		System.out.println(rlist);
		System.out.println(r);
		System.out.println(f);
		System.out.println(slot);
		System.out.println(orderCount);
		System.out.println(glist);
		System.out.println(avgGrade);
		
		if(b!=null){
			page = "views/sale/saleDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("oplist", oplist);
			request.setAttribute("flist", flist);
			request.setAttribute("rlist", rlist);
			request.setAttribute("r", r);
			request.setAttribute("f", f);
			request.setAttribute("slot", slot);
			request.setAttribute("orderCount", orderCount);
			if(glist != null){
				request.setAttribute("glist", glist);
			}
				request.setAttribute("avgGrade", avgGrade);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
