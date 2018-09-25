package com.comvision.artBridge.writer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.comvision.artBridge.common.MyFileRenamePolicy;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.writer.model.service.WriterService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateProfile.wr")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		
		if(ServletFileUpload.isMultipartContent(request)){
			//썸네일 파일 첨부 저장용
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "image/profile/";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> filesName = multiRequest.getFileNames();
			
			while(filesName.hasMoreElements()){
				String name = filesName.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			ArrayList<Files> fileList = new ArrayList<Files>();
			
			for(int i = originFiles.size() -1; i >= 0; i--){
				Files at = new Files();
				at.setFiles_root(savePath);
				at.setFiles_title(originFiles.get(i));
				at.setChange_title(saveFiles.get(i));
				
				fileList.add(at);
			}
		

			//member테이블에 저장할 데이터 가져오기
			/*String nick = multiRequest.getParameter("nick");
			String introduction = multiRequest.getParameter("introtxt");
			int writer_slot = Integer.parseInt(multiRequest.getParameter("slot"));
			String[] reception_status = multiRequest.getParameterValues("reception_status");
			
			System.out.println(nick);
			System.out.println(introduction);
			System.out.println(writer_slot);
			System.out.println(reception_status);*/

		}
		
		//member테이블에 저장할 데이터 가져오기
		String nick_name = request.getParameter("nick");
		String introduction = request.getParameter("introtxt");
		int writer_slot = Integer.parseInt(request.getParameter("slot"));
		String[] reception_status = request.getParameterValues("reception_status");
		
		System.out.println(nick_name);
		System.out.println(introduction);
		System.out.println(writer_slot);
		System.out.println(reception_status);

		
		//member객체 생성
		Member m = new Member();
		m.setNick_name(nick_name);
		m.setIntroduction(introduction);
		m.setWriter_slot(writer_slot);
		//m.setReception_status(reception_status);
		
		
		//service 전송
		/*int result = new WriterService().insertPiece(m, fileList);
		
		System.out.println("결과 : " + result);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectPieceList.wr?memberNo=" + memberNo);
		}else{
			//실패시 서버에 저장된 파일 삭제
			for(int i = 0; i <saveFiles.size(); i++){
				//파일 시스템에 저장된 이름으로 파일 객체 생성함
				File failedFile = new File(savePath + saveFiles.get(i));
				
				failedFile.delete();
			}
			
			//에러페이지로 메시지 전달
			request.setAttribute("msg", "사진 게시판 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
