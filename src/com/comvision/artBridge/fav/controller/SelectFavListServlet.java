package com.comvision.artBridge.fav.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comvision.artBridge.fav.model.service.FavService;
import com.comvision.artBridge.fav.model.vo.Fav;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;

/**
 * Servlet implementation class SelectFavListServlet
 */
@WebServlet("/selectFavList.fv")
public class SelectFavListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFavListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
		
		//관심 작가 리스트
		ArrayList<Fav> flist = new FavService().selectFavlist(mNo);
		
		//관심 작가 프로필
		ArrayList<HashMap<String, Object>> hlist = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hmap = null;
		
		for(Fav f : flist){
			hmap = new HashMap<String, Object>();
			Member m = new FavService().selectWriterinfo(f.getWriter_no());
			int bcount = new FavService().wriSaleBoardCount(f.getWriter_no());
			int grade = new FavService().selectWriGrade(f.getWriter_no());
			int order = new FavService().wriOrderCount(f.getWriter_no());
			Files file = new FavService().wriprofile(f.getWriter_no());
			String profile = file.getFiles_root();
			String change = file.getChange_title();
			System.out.println(change);
			String nick = m.getNick_name();
			int slot = m.getWriter_slot();
			
			hmap.put("minfo", m);
			hmap.put("bcount", bcount);
			hmap.put("grade", grade);
			hmap.put("orcount", order);
			hmap.put("profile", profile);
			hmap.put("nick", nick);
			hmap.put("slot", slot);
			hmap.put("change", change);
			
			hlist.add(hmap);
		}
		
		String page = null;
		
		if(hlist!=null){
			page = "views/myPage/myFavListForm.jsp";
			request.setAttribute("hlist", hlist);
			request.setAttribute("flist",flist);
			
		}else{
			page = "views/myPage/myFavListForm.jsp";
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
