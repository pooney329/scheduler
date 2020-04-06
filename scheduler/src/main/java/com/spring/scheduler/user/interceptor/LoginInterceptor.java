package com.spring.scheduler.user.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
		HttpSession session  = request.getSession();
		Cookie[] cookies = request.getCookies();
		
	
		
		
		
 
		/*
		 * Map<String, Object> model = modelAndView.getModel();
		 * 
		 * 
		 * if (model.get(LOGINUSER) != null) { UserDTO user = (UserDTO)
		 * model.get(LOGINUSER); session.setAttribute(LOGINUSER, user);
		 * System.out.println(request.getContextPath() + "얄루");
		 * 
		 * // response.sendRedirect(request.getContextPath()); }
		 * 
		 * else { System.out.println(request.getContextPath() + "얌마");
		 * System.out.println(model.get(MESSAGE)); //
		 * response.sendRedirect(request.getContextPath()); }
		 */
			
			
	}

	
	
}

