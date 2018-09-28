package com.comvision.artBridge.member.controller;

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
import com.comvision.artBridge.member.model.service.MemberService;
import com.comvision.artBridge.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

/**
 * Servlet implementation class RequestWriterRightUpdate
 */
@WebServlet("/reqWriterRight.me")
public class RequestWriterRightUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestWriterRightUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 50;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "image/confirmImg_upload/request_writerRight/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFilesNameList = new ArrayList<String>();
			ArrayList<String> originFilesNameList = new ArrayList<String>();
			
			Enumeration<String> fileNames = multiRequest.getFileNames();
			
			int cursorPoint = 1;
			while(fileNames.hasMoreElements()){
				System.out.println("파일 이름 요소다 오니?? " + cursorPoint + "\n");
				String name = fileNames.nextElement();
				
				saveFilesNameList.add(multiRequest.getFilesystemName(name));
				originFilesNameList.add(multiRequest.getOriginalFileName(name));
				System.out.println("저장 할 사진 이름 리스트" + cursorPoint + "번째 정보 : " + saveFilesNameList.get(cursorPoint));
				System.out.println("저장 할 사진 이름 리스트" + cursorPoint + "번째 정보 : " + saveFilesNameList.get(cursorPoint));
				cursorPoint++;
			}

			System.out.println("반복문 끝났는데 몇 개 받아오니?" + cursorPoint);
			System.out.println("세이브 파일 이름 리스트 개수야 : " + saveFilesNameList.size());
			System.out.println("원래 파일 이름 리스트 개수야 : " + originFilesNameList.size());
			
			int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_no();
			String mBank = multiRequest.getParameter("userBank");
			String mAccount = multiRequest.getParameter("userAccount");
			System.out.println("0-1. 업데이트 할 넘어온 유저 정보야 (mNo : " + mNo + " , mBank : " + mBank + ", mAccount : " + mAccount);
			
			Member m = new Member();
			m.setMember_no(mNo);
			m.setBank(mBank);
			m.setAccount(mAccount);
			System.out.println("0-2. 멤버 잘 만들어 졌어요? : " + m.toString());
			
			ArrayList<Files> fileList = new ArrayList<Files>();
			for(int i = originFilesNameList.size(); i > 0; i--){
				Files file = new Files();
				
				file.setF_reference_no(mNo);
				file.setFiles_title(originFilesNameList.get(i));
				file.setChange_title(saveFilesNameList.get(i));
				System.out.println(i + " 번째 파일 리스트의 정보야" + file.toString());
				
				switch(i){
					case 3 : file.setFiles_type(7); break;
					case 2 : file.setFiles_type(6); break;
					case 1 : file.setFiles_type(5); break;
				}
				file.setFiles_root(savePath);
				
				fileList.add(file);
				System.out.println("1. 파일 잘 저장 됐어요? : " + i + " 번째 부터 저장 (원래 이름 : " + originFilesNameList.get(i) + ")");
				System.out.println("1-1 파일리스트 사이즈 : " + fileList.size());
			}
			System.out.println("파일리스트 최종 사이즈얌 : " + fileList.size());
			int result = new MemberService().request_writerRight(m, fileList);
			
			/*만약 파일 타입이 하나라도 이미지 파일이 아니거나 내용 처리 확인하기    메모장 내용 참조*/
			
			System.out.println("결과 : " + result);
			
			if(result > 4){
				/*response.getWriter().print(result);*/
				response.sendRedirect("/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu");
			}else{
				for(int i = 0; i < saveFilesNameList.size(); i++){
					System.out.println("실패하면 : " + saveFilesNameList.size());
					System.out.println("실패했을 지울거 : " + saveFilesNameList.get(i).toString());
					File failedFile = new File(savePath + saveFilesNameList.get(i));
				
					failedFile.delete();
				}
				/*response.getWriter().print(result);*/
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
