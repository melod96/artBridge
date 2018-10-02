package com.comvision.artBridge.writer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.comvision.artBridge.admin.model.vo.Rating;
import com.comvision.artBridge.board.model.vo.Board;
import com.comvision.artBridge.board.model.vo.PageInfo;
import com.comvision.artBridge.common.MyFileRenamePolicy;
import com.comvision.artBridge.files.model.vo.Files;
import com.comvision.artBridge.member.model.vo.Member;
import com.comvision.artBridge.relate.model.vo.Relate;
import com.comvision.artBridge.relate.model.vo.RelateNumList;
import com.comvision.artBridge.sale.model.vo.Options;
import com.comvision.artBridge.writer.model.service.WriterService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertPiece.wr")
public class InsertPieceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPieceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)){
			//썸네일 파일 첨부 저장용
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "image/thumbnail_upload/";
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
		
			
			//Board테이블에 저장할 데이터 가져오기
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			String title = multiRequest.getParameter("title");
			int resolution = Integer.parseInt(multiRequest.getParameter("resolution"));
			String file_type = multiRequest.getParameter("file_type");
			String file_size = multiRequest.getParameter("file_size");
			int working_period = Integer.parseInt(multiRequest.getParameter("working_period"));
			String contents = multiRequest.getParameter("contents");
			
			//Board객체 생성
			Board b = new Board();
			b.setMember_no(memberNo);
			b.setBoard_title(title);
			b.setResolution(resolution);
			b.setSubmit_file_type(file_type);
			b.setSubmit_size(file_size);
			b.setWorking_period(working_period);
			b.setBoard_content(contents);
			
			
			//options테이블에 저장할 데이터 가져오기
			int optionCount = Integer.parseInt(multiRequest.getParameter("optionCount")); //사용자가 입력한 옵션갯수
			//System.out.println("입력한 옵션 갯수 들어왔니?" + optionCount);
			
			String[] option = multiRequest.getParameterValues("option");
			String[] price = multiRequest.getParameterValues("price");
			
			int[] intArr = null;
			if(price != null){
				intArr = new int[price.length];
				for(int i= 0; i < optionCount; i++){
					intArr[i] += Integer.parseInt(price[i]);
				}
			}
			
			ArrayList<Options> optionsList = new ArrayList<Options>();
			
			if(option != null && price != null){
				for(int i = 0; i < optionCount; i++){
					Options op = new Options();
					op.setOptions_name(option[i]);
					op.setOptions_price(intArr[i]);

					optionsList.add(op);
					//System.out.println("ArrayList에 담긴것 : " + optionsList);
				}
			} 
			
			//연관검색어 R_N_LIST테이블에 저장할 데이터 가져오기
			String[] relateCk = multiRequest.getParameterValues("relateCk");
			
			//service 전송
			int result = new WriterService().insertPiece(b, fileList, relateCk, optionsList, memberNo);
			
			//System.out.println("결과 : " + result);
			
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
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
