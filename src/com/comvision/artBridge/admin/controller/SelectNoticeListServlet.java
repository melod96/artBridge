package com.comvision.artBridge.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.admin.model.service.NoticeService;
import com.comvision.artBridge.admin.model.vo.Notice;
import com.comvision.artBridge.admin.model.vo.PageInfo;

@WebServlet("/selectNoticeList.no")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*//페이징처리 추가시 필요 변수 선언
		int currentPage; 	//현재 내가 보고있는페이지, 현재 페이지를 표시할 변수
		int limit; 			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표실될 페이지가 시작할 페이지
		int endPage; 		//한 번에 표시될 페이지가 끝나는 페이지
		
		//게시판은 1페이지부터 시작함
		currentPage = 1;
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//전체 목록 갯수를 리턴받음
		int listCount = new NoticeService().getListCount();
		
		//총 페이지수 계산
		//예) 목록 수가 123개이면 페이지가 13개가 필요함
		maxPage = (int)((double)listCount / limit + 0.9); //int끼리의 결과는 int로 나온다. 즉 13개가 필요한데 12가 나옴 그래서 형변환
		
		//시작페이지 계산
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1; //()안의 코드는 십의 자리를 떼는 공식, 대부분 이렇게 사용함
		
		//목록 아래쪽에 보여질 마지막 페이지 수 
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		System.out.println("PageInfo : " + pi);
		//페이징 처리 이전
		//ArrayList<Board> list = new BoardService().selectList();
		
		//페이징 처리 이후
		ArrayList<Notice> list = new NoticeService().selectList(currentPage, limit);
		
		System.out.println("페이징처리 : " + list);
		
		String page = "";
		
		if(list != null){
			page = "views/admin/noticeList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
		}*/
				
		
		//공지사항 리스트 출력
		ArrayList<Notice> list = new NoticeService().selectList();
	
		String page = "";
		if(list != null){
			page = "/views/admin/noticeList.jsp";
			request.setAttribute("list", new NoticeService().selectList());
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
