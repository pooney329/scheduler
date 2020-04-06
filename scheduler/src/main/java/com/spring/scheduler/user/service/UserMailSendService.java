package com.spring.scheduler.user.service;

import javax.servlet.http.HttpServletRequest;

public interface UserMailSendService {
	
	//랜덤 키 생성 
	public String createKey();
	//키범위 정하기 
	public String setKey(boolean lowerCheck , int size);
	//회원 인증 메일 보내기 
	public void mailSendKey(String email, String uid, HttpServletRequest request, String key);
		 

}
