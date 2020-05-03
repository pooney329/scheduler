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

public class AuthInterceptor extends HandlerInterceptorAdapter  implements SessionAttr{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER);
		if(user != null) {
			return true;
			
		}else {
			savePage(request, session);
			response.sendRedirect(request.getContextPath()+"/user/login");
			return false;
		}
		
		
		
			
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
			
	}
	
	
	//이전 페이지 저장 
	private void savePage(HttpServletRequest request , HttpSession session) {
		
		
		//uri저장
		String uri = request.getRequestURI();
		if(uri.contains("team/teamapplication")) {
			uri="/team/teamdetail";
		}
		//쿼리스트링 저장
		String query = request.getQueryString(); //ex) /test/test?num=1&page=2 
		//쿼리 스트링이 null이 아닌경우 
		if(query != null) {
			uri += "?"+query;
		}
		
		session.setAttribute(SessionAttr.STOREDPAGE, uri);
		
	}

	
	
}

