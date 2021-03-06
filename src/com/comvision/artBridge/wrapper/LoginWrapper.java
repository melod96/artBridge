package com.comvision.artBridge.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper{

	public LoginWrapper(HttpServletRequest request){
		super(request);
	}
	
	@Override
	public String getParameter(String key){
		String value = "";
		
		if(key != null && key.equals("userPwd")){
			value = getSha512(super.getParameter("userPwd"));
		}else if(key != null && key.equals("joinUserPwd")){
			value = getSha512(super.getParameter("joinUserPwd"));
		}else if(key != null && key.equals("myPageUserPwd")){
			value = getSha512(super.getParameter("myPageUserPwd"));
		}else if(key != null && key.equals("updateUserPwd")){
			value = getSha512(super.getParameter("updateUserPwd"));
		}else if(key != null && key.equals("changeUserPassword")){
			value = getSha512(super.getParameter("changeUserPassword"));
		}else{
			value = super.getParameter(key);
		}
		
		return value;
	}
	
	private static String getSha512(String pwd){
		String encPwd = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("utf-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}
	
	
}
