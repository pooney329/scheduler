package com.spring.scheduler.auth;





import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;


public class SnsValue implements SnsUrls{
	
	
	private String service; //sns종류
	private String clientId; //클라이언트 아이디
	private String clientSecret; //키값 비밀번호 
	private String redirectUrl;  //리다이렉트 주소
	private DefaultApi20 api20Instance;   
	private String profileUrl;//프로필정보(이름,이메일)등 조회 하기 위한 url
	private String googlescope;//프로필정보(이름,이메일)등 조회 하기 위한 url
	
	//네이버 ,구글인지 확인 하기 위함 
	private boolean isNaver;  
	private boolean isGoogle;
	
	SnsValue(String service , String clientId , String clientSecret, String redirectUrl){
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isGoogle = StringUtils.equalsIgnoreCase("google", this.service);
		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		
		if(isNaver) {
			api20Instance = NaverAPI20.instance();
			profileUrl = NAVER_PROFILE_URL;
			
		}
		else if(isGoogle) {
			api20Instance = GoogleApi20.instance();
			profileUrl = GOOGLE_PROFILE_URL;
			googlescope = GOOLESCOPE;
		}
		
		
		
		
	}
	
	public String getGooglescope() {
		return googlescope;
	}

	public void setGooglescope(String googlescope) {
		this.googlescope = googlescope;
	}

	public boolean isNaver() {
		return isNaver;
	}

	public void setNaver(boolean isNaver) {
		this.isNaver = isNaver;
	}

	public boolean isGoogle() {
		return isGoogle;
	}

	public void setGoogle(boolean isGoogle) {
		this.isGoogle = isGoogle;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public DefaultApi20 getApi20Instance() {
		return api20Instance;
	}

	public void setApi20Instance(DefaultApi20 api20Instance) {
		this.api20Instance = api20Instance;
	}

	public String getProfileUrl() {
		return profileUrl;
	}

	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}
	
	
	
	
	
}
