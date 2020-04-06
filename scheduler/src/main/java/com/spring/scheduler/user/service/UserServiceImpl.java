package com.spring.scheduler.user.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.scheduler.user.dao.UserDAO;
import com.spring.scheduler.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO userDao;
	
	@Inject
	UserMailSendService userMail;
	
	
	@Override
	public  Map<String, Boolean> checkUser(UserDTO user) {

		return userDao.checkUser(user);
	}
	@Override
	public UserDTO actionLogin(UserDTO user) {
		
		return userDao.actionLogin(user);
	}
	@Override
	public UserDTO snsCheck(UserDTO user) {
		
		return userDao.snsCheck(user);
	}
	@Override
	public boolean checkId(String uid) {
		
		return userDao.checkId(uid);
	}
	
	@Transactional
	@Override
	public void actionJoin(UserDTO user, HttpServletRequest request) {
		String key = null;
		
		//sns회원이 아닌 일반 회원가입인경우 이메일인증을 위한 키값 생성 
		if(user.getEmailauthentication() == null) {
			key = userMail.setKey(false, 20);
			user.setEmailauthentication(key);
		}
		
		//sns를 이용한 회원가입의 경우 uid와 pwd에 해당이메일 값을 삽입 
		else {
			if(user.getGoogleid() !=null) {
				user.setUid(user.getGoogleid());
				user.setPwd(user.getGoogleid());
			}
			else {
				user.setUid(user.getNaverid());
				user.setPwd(user.getNaverid());
			}
			
		}
		
		// sns OR 일반 회원가입 실행 
		userDao.actionJoin(user);
		
		
		//일반회원가입의 경우 인증이메일을 해당 회원 메일로 전송해야한다.
		if(!user.getEmailauthentication().equals("Y")) {
			userMail.mailSendKey(user.getEmail1()+"@"+user.getEmail2(), user.getUid(), request ,key);
		}
		
		
		
	}
	@Transactional
	@Override
	public String updateEmailaAuth(String uid, String key) {
		boolean check = userDao.checkEmailaAuth(uid, key);
		
		if(check) {
			userDao.updateEmailaAuth(uid);
			return "ok";
		}
		else {
			return "fail";
		}
		
	}
	
	
	
	
	@Override
	public boolean emailAuthDuplicate(Map<String, String> map) {
		
		return userDao.emailAuthDuplicate(map);
				
	}
	
	//이메일이 변경되면 다시 인증이메일을 전송한다 
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public boolean emailAuthIdUpdate(Map<String, String> map ,HttpServletRequest request){
		
		//인증이메일 아이디 변경 
		boolean check = userDao.emailAuthIdUpdate(map);
		
		//키를 다시 셋팅하고 변경된 이메일 아이디로 다시 인증 메일을 전송한다
		String key = userMail.setKey(false, 20);
		userMail.mailSendKey(map.get("email1")+"@"+map.get("email2"), map.get("uid"), request ,key);
		
		
		return check;
	}

}
