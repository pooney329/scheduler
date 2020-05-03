package com.spring.scheduler.user.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.mysql.cj.util.StringUtils;
import com.spring.scheduler.user.dto.UserDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter  implements SessionAttr{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession  session  = request.getSession();
		//세션체크 
		if(session != null) {
			
			String storedpage = (String) session.getAttribute(STOREDPAGE);
			//기존에 저장된 페이지가 있는지 확인 
			if(storedpage != null) {
				
				//기존에 저장된 페이지로 이동 
				response.sendRedirect(request.getContextPath()+storedpage);
				session.removeAttribute(STOREDPAGE);
				System.out.println("저장된 페이지"+session.getAttribute(STOREDPAGE));
			}
			else {
				
				//저장된 페이지가 없는 경우 처음 단순 로그인 한 것이라 간주하여 메인페이지로 리다이렉트 시킴
				response.sendRedirect(request.getContextPath());
				
			}
			
		}
		else {
			
			//이메일인증을 안한 상태로  이메일 인증을 하라는 페이지로 리다이렉트 시킴 
			if(modelAndView.getViewName().contains("emailReAuthentication")){
				response.sendRedirect(request.getContextPath()+"/uesr/emailReAuthentication");
				
			}
			
		}
		
		
			
	}
	
	
	

	
	
}

