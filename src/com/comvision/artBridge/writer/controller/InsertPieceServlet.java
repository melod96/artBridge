package com.comvision.artBridge.writer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.common.MyFileRenamePolicy;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.writer.model.service.WriterService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertPiece.wr")
public class InsertPieceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPieceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿으로 들어옴");
		
		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			
			String savePath = root + "image/thumbnail_upload/";
			System.out.println(savePath);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			//지정한 파일의 이름을 저장할 arrayList생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본 파일의 이름을 저장할 arrayList생성(다운받을때 파일명 원복)
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//파일의 이름을 반환한다.
			Enumeration<String> filesName = multiRequest.getFileNames();
			
			while(filesName.hasMoreElements()){
				String name = filesName.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				//역순으로 꺼내져온다
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
			}
			
			int member_no = Integer.parseInt(multiRequest.getParameter("member_no"));
			String title = multiRequest.getParameter("title");
			int resolution = Integer.parseInt(multiRequest.getParameter("resolution"));
			String file_type = multiRequest.getParameter("file_type");
			String file_size = multiRequest.getParameter("file_size");
			int working_period = Integer.parseInt(multiRequest.getParameter("working_period"));
			
			//String option01 =  
			//int price01=
			
			String contents = multiRequest.getParameter("contents");
			
			//Board객체 생성
			Board b = new Board();
			b.setBoard_title(title);
			b.setResolution(resolution);
			b.setSubmit_file_type(file_type);
			b.setSubmit_size(file_size);
			b.setWorking_period(working_period);
			
			b.setBoard_content(contents);


			//Attachment 객체 생성하여 ArrayList객체 생성
			ArrayList<Files> fileList = new ArrayList<Files>();
			
			//반복문을 역으로 돌리는 이유는 파일리스트가 역순으로 들어오기 때문에 되돌려 주기 위해서 이다.
			for(int i = originFiles.size() -1; i >= 0; i--){
				Files at = new Files();
				at.setFiles_root(savePath);
				at.setFiles_title(originFiles.get(i));
				at.setChange_title(saveFiles.get(i));
				
				fileList.add(at);
			}
		
			//System.out.println(title + ", " + resolution + ", " + file_type + ", " + file_size + "," + working_period);
			
			
			//service 전송
			/*int result = new WriterService().insertThumbnail(b, fileList);
			
			System.out.println("결과 : " + result);
			
			if(result > 0){
				response.sendRedirect(request.getContextPath() + "/selectPieceList.wr");
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
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
