package com.spring.scheduler.user.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.scheduler.user.dao.UserDAO;

@Service
public class UserMailSendServiceImpl implements UserMailSendService {
	
	
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private UserDAO userDao;


	
	private boolean lowerCheck;
	private int size;
	

	
	@Override
	public String createKey() {
		StringBuffer sb = new StringBuffer();
		Random ran = new Random();
		int i = 0; 
		
		do {
			i = ran.nextInt(75) + 48;
			if((i >= 48 && i <= 57) || (i >= 65 && i <= 90) || (i >= 97 && i <= 122)) {
				sb.append((char) i);
				
			}
			else {
				continue;
			}
			
		}while(sb.length() < size);
		
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
		
	}

	@Override
	public String setKey(boolean lowerCheck , int size) {
		this.lowerCheck = lowerCheck ;
		this.size = size;
		return createKey();
	}

	@Override
	public void mailSendKey(String email, String uid, HttpServletRequest request, String key) {
		//String key = setKey(false, 20);
		userDao.insertEmailAuth(key, uid);
		MimeMessage mail = mailSender.createMimeMessage();
		
		String htmlStr = "<h2>안녕하세요  scheduler 입니다!</h2><br><br>" 
				+ "<h3>" + uid + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8080" + request.getContextPath() + "/user/emailauth?uid="+ uid +"&key="+key+"'>인증하기</a></p>";
		try {
			mail.setSubject("[본인인증] scheduler 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}


		

	}

}
