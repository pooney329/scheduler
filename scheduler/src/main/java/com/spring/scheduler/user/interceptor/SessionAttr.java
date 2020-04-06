package com.spring.scheduler.user.interceptor;

public interface SessionAttr {
	static final String LOGINUSER ="loginuser";
	static final String LOGINCOOKIE = "logincookie";
	static final int EXPIRE = 7 * 24 * 60 * 60;
	static final String STOREDPAGE = "STOREDPAGE";
	static final String MESSAGE = "message";
	static final String TEMPORARYUSER = "temporaryuser";
}
