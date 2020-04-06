package com.spring.scheduler.auth;

import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.ExecutionException;

import org.apache.commons.lang3.StringUtils;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.spring.scheduler.user.dto.UserDTO;

public class SnsLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;  //구글, 네이버에 대한 정보를 저장하는 객체

	
	//ServiceBuilder를 만든다 (id,secret,라이렉트 url,api20Instance(구글 api20Instance , 네이버 api20Instance))
	public SnsLogin(SnsValue sns) {
		this.sns = sns;
		if(!sns.isGoogle()) {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl()).build(sns.getApi20Instance());
		}
		else {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl()).scope(sns.getGooglescope()).build(sns.getApi20Instance());
		}
	}
	//code를 얻기위한 인증 url 이후 획득한 code 와 id, secrete를 통해 토큰을 획득한다.  
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
		
		
	}
	//유저정보 가져오기 
	public UserDTO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("액세스 토큰 "+accessToken.getAccessToken().toString());
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		System.out.println(response.getBody());
		return parseJson(response.getBody());
				

	}
	
	
	//json 형식으로 변환 한 뒤 이메일,이름 정보 가져오기 
	private UserDTO parseJson(String body) throws Exception {
		UserDTO user = new UserDTO();
		ObjectMapper mapper = new ObjectMapper(); // 객체랑 json이랑 맵핑
		JsonNode root = mapper.readTree(body);
		
		if(this.sns.isNaver()) {
			JsonNode resNode  = root.get("response");
			user.setUid(resNode.get("id").asText());
			//user.setEmail(resNode.get("email").asText());
			user.setName(resNode.get("name").asText());
			user.setNaverid(resNode.get("email").asText());

		}
		else if(this.sns.isGoogle()){
			user.setUid(root.get("id").asText());
			user.setName(root.get("displayName").asText());
			Iterator<JsonNode> iterEmails = root.path("emails").elements();
			while(iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if (StringUtils.equals(type, "ACCOUNT")) {
					//user.setEmail(emailNode.get("value").asText());
					user.setGoogleid(emailNode.get("value").asText());
					break;
				}
			}
			
		}
		return user;
	}
}
