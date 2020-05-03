package com.spring.scheduler.user.interceptor;

public interface SessionAttr {
	static final String LOGINUSER ="loginuser";//세션아이디
	static final String LOGINCOOKIE = "logincookie";//쿠키
	static final int EXPIRE = 7 * 24 * 60 * 60; // 쿠키만료시간
	static final String STOREDPAGE = "STOREDPAGE";  // 이전 페이지 저장 
	static final String MESSAGE = "message";  //메시지 
	static final String TEMPORARYUSER = "temporaryuser"; //임시 유저 
}
