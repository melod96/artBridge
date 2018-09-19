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

@WebServlet("/deleteNotice.no")
public class UpdateNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoticeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//삭제할 게시물의 고유 넘버를 가져옴(체크박스 체크한 만큼을 배열로 가져옴)
		String[] contCheck = request.getParameterValues("contCheck"); 
		
		String delCk = "";
		if(contCheck != null){
			for(int i = 0; i < contCheck.length; i++){
				if(i == 0){
					delCk += contCheck[i];
				}else{
					delCk += ", " + contCheck[i];
				}
			}
			System.out.println(delCk);
		}
		
		
		ArrayList<Notice> list = new NoticeService().delNotice(delCk);
		
		String page = "";
		if(list != null){
			page = "/views/admin/noticeList.jsp";
			request.setAttribute("list", new NoticeService().delNotice(delCk));
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		//getParameterValues를 이용 배열로 받는다.
		/* if( cp_no.length != 0 ){
		          whereStr = " and  cp_no in ( ";  // in(or)이용
		          for( int i=0; i<cp_no.length; i++ ){ //배열의 길이만큼 for문으로 돌린다
		        	  whereStr += cp_no[i]; 
					  if( i != (cp_no.length-1) ){
						  whereStr += " , ";
					  }
		          }
		          whereStr += " )  ";
		 }
		 buffer.append(" UPDATE TBLCAFEPOST SET ")
		                  .append(" CP_ISDELETE = 'Y'")
		                  .append(" where blc_no = ").append(utilBean.convertDB(getParameter("blc_no")))
		                  append(whereStr); 
		            
		            query = buffer.toString();
		       
		            buffer.delete(0, buffer.length());
		            iAffected = stmt.executeUpdate(query);
		            if ( iAffected != 1 ) {
		              throw new SQLException("ERROR! " + iAffected + " rows effected, QUERY : " + query);
		            } else {
		              htReturn.put("isOK", "Y"); //Hashtable에 성공 여부 저장
		            }*/

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
