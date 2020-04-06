package com.spring.scheduler.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spring.scheduler.user.dto.UserDTO;


public interface UserService {
	//로그인페이지에서 ajax 를 통한 아이디 비번 확인 
	public Map<String, Boolean> checkUser(UserDTO user);
	
	//checkUser에서 true가 나오면 실행해서 로그인하려는 회원의 정보를 db에서 가져온다 
	public UserDTO actionLogin(UserDTO user);
	//sns 유저확인 후 로그인 
	public UserDTO snsCheck(UserDTO user);
	
	//아이디 중복확인
	public boolean checkId(String uid);
	
	// 회원가입
	public void actionJoin(UserDTO user, HttpServletRequest request);
	
	//이메일인증 한 후 사용자의 인증컬럼 Y로 바꾸기 
	public String updateEmailaAuth(String uid, String key);
	
	//이메일 인증 이메일의 변경이 필요한경우  중복된 이메일인지 확인하기
	public boolean emailAuthDuplicate(Map<String,String> map);
	//이메일 인증 아이디 변경 하기 
	public boolean emailAuthIdUpdate(Map<String,String> map , HttpServletRequest request);


}
