package com.spring.scheduler.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.mysql.cj.Session;
import com.spring.scheduler.auth.SnsLogin;
import com.spring.scheduler.auth.SnsUrls;
import com.spring.scheduler.auth.SnsValue;
import com.spring.scheduler.user.dao.UserDAO;
import com.spring.scheduler.user.dao.UserDAOImpl;
import com.spring.scheduler.user.dto.UserDTO;
import com.spring.scheduler.user.interceptor.SessionAttr;
import com.spring.scheduler.user.service.UserMailSendService;
import com.spring.scheduler.user.service.UserMailSendServiceImpl;
import com.spring.scheduler.user.service.UserService;

@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	SnsValue naverSns;
	@Inject
	SnsValue googleSns;
	@Inject
	UserService userService;
	@Inject
	UserMailSendService userMailService;
	
	//oauth 리다이렉트 콜백  
	@RequestMapping("/auth/{service}/callback")
	public String oauthLogin(@PathVariable String service, @RequestParam String code, HttpServletRequest request, Model model,HttpSession session) throws UnsupportedEncodingException {
		SnsValue oauth;
		
		
		//snsemail 세션 삭제 
		
		if (session.getAttribute("snsemail") != null) {
			System.out.println("sns이메일 실행");
			session.removeAttribute("snsemail");
		}
		
		//요청 url이 네이버인지 구글인지 확인 
		if(StringUtils.equals(service, "naver")){
			 oauth  = naverSns;
		}
		else {
			 oauth  = googleSns;
		}
		try {
			SnsLogin  snslogin = new SnsLogin(oauth);
			//sns인증으로 회원정보가 가져오기 
			UserDTO user =snslogin.getUserProfile(code);
			//인증 후 인증된값으로 데이터베이스에 등록된 회원인지 체크하기 
			UserDTO snsuser = userService.snsCheck(user);
			// db에 등록된 회원이 아닌경우 회원가입페이지로 리다이렉트 시키기 
			if(snsuser == null) {
				//세션에 snsemail 등록 하여  회원등록페이지에 email 값 넘기기 
				System.out.println("구글"+ oauth.isGoogle());
				System.out.println("네이버"+ oauth.isNaver());
				
				if(oauth.isGoogle()) {
					session.setAttribute("snsemail", user.getGoogleid());
				}
				else {
					session.setAttribute("snsemail", user.getNaverid());
				}
				
				return "redirect:/user/snsjoin";
			}
			else {
				
				session.setAttribute(SessionAttr.LOGINUSER, snsuser);
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index"; 
		
		
		
	}
	
	
	//로그인 페이지 이동 (oauth code를 얻기 위한 oauth인증 url 생성)
	@RequestMapping("/login")
	public ModelAndView test(HttpSession session, ModelAndView mav) {
		SnsLogin naverlogin = new SnsLogin(naverSns);
		String nanverurl = naverlogin.getNaverAuthURL();
		
		SnsLogin googlelogin = new SnsLogin(googleSns);
		String googleurl = googlelogin.getNaverAuthURL();
		
		/*
		 * 인증 url을 생성 할때 아래의 코드를 사용하대 된다. 권한타입은  AUTHORIZATION_CODE를 사용하고  googleOAuth2Parameters(id,screte, redirect url)을 삽입한다.
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleurl = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("googleurl", googleurl);
		
		*/
		
		
		mav.setViewName("user/login");
		mav.addObject("naver", nanverurl);
		mav.addObject("google", googleurl);
		return mav;
	}
	
	//로그인 실행
	@RequestMapping(value="/actionLogin" , method=RequestMethod.POST)
	public String actionLogin(UserDTO user, Model model , RedirectAttributes re,HttpSession session) {
		UserDTO loginuser = userService.actionLogin(user); //로그인하기
		
		if(!loginuser.getEmailauthentication().equals("Y")) {
			re.addFlashAttribute(SessionAttr.TEMPORARYUSER, loginuser);
			
			return "emailReAuthentication";
		}
		else {
			
			session.setAttribute(SessionAttr.LOGINUSER, loginuser);
			System.out.println(user);
			return "index";
		}
		
		
		
		
	}
	//이메일 다시 인증페이지 이동
	@RequestMapping(value = "/emailReAuthentication" ,method=RequestMethod.GET)
	public void emailReAuthentication() {
		
		
	}
	
	//이메일 인증 이메일의 변경이 필요한경우  중복된 이메일인지 확인하기 
	@RequestMapping(value="/emailAuthDuplicate" , method=RequestMethod.GET)
	@ResponseBody
	public Boolean emailReAuthentication(String email1 , String email2) {
		Map<String ,String> map = new HashMap<String, String>();
		map.put("email1", email1);
		map.put("email2", email2);
		boolean check = userService.emailAuthDuplicate(map);
		return check;
	}
	//이메일 인증 아이디 변경 
	@RequestMapping(value="/emailAuthIdUpdate" , method=RequestMethod.POST)
	public String emailAuthIdUpdate(@RequestParam Map<String, String> map ,RedirectAttributes re ,HttpServletRequest request) {
		
		
		boolean check = userService.emailAuthIdUpdate(map ,request);
		if(check == true) {
			re.addFlashAttribute("message" , "인증 이메일이 변경되었습니다. 인증  완료 후 다시 이용해주세요 ");
		}
		else {
			re.addFlashAttribute("message" , "에러가 발생되었습니다. 잠시 후 다시 이용해주세요");
		}
			
		return "redirect:login";
	}
	
	//이메일 인증 후 확인 
	@RequestMapping("/emailauth")
	public String emailauth(String uid ,String key) {
		String check = userService.updateEmailaAuth(uid, key);
		if(check == "ok") {
			return "user/emailAuthSucess";
		}
		else {
			return "user/emailauthfail";
		}
		
		
	}
	
	
	//로그인페이지에서 ajax를 통해 아이디 비번이 올바른지 확인 
	@RequestMapping(value="/usercheck",  method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> usercheck(@RequestBody UserDTO user){
	
		
		  Map map = userService.checkUser(user); 
		  HttpHeaders responseHeaders = new HttpHeaders(); 
		  responseHeaders.add("Content-Type","application/json; charset=UTF-8");
		  System.out.println("++"+map.get("is_emailauth"));
		  System.out.println("++"+map.get("is_userd"));
		  
		return new ResponseEntity<>(map,responseHeaders,HttpStatus.OK);
		
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//회원가입페이지 이동
	@RequestMapping("/join")
	public void join(Model model) {
		SnsLogin naverlogin = new SnsLogin(naverSns);
		String nanverurl = naverlogin.getNaverAuthURL();
		
		SnsLogin googlelogin = new SnsLogin(googleSns);
		String googleurl = googlelogin.getNaverAuthURL();
		
		
		model.addAttribute("naver", nanverurl);
		model.addAttribute("google", googleurl);
		
	}
	
	//일반회원가입페이지 이동
	@RequestMapping("normaljoin")
	public void normaljoin(){
		
	}
	
	//아이디 중복확인
	@RequestMapping("/checkid")
	@ResponseBody
	public ResponseEntity<Boolean> checkid(@RequestBody Map<String, String> map){
		
		String uid = map.get("uid"); 
		
		 
		//boolean checkid = userService.checkId(uid);
			
		return new ResponseEntity<Boolean>(userService.checkId(uid), HttpStatus.OK);
	}

	@RequestMapping("/joinaction")
	public String joinaction(UserDTO user , HttpServletRequest request){
		//sns회원가입 시 세션에  등록된 snsemail을 삭제한다 
		HttpSession session = request.getSession();
		session.removeAttribute("snsemail");
		userService.actionJoin(user, request);
		
		return "index";
	}
	
	
	/*
	 * @RequestMapping("/re") public String re(HttpServletRequest request) {
	 * 
	 * 
	 * userMailService.mailSendKey("soso", "hookcu329", request);
	 * 
	 * return "index"; }
	 * 
	 * 
	 */	
	
	
	//sns를 이용한 회원가입
	@RequestMapping("/snsjoin")
	public void snsjoin() {
		
	}
	
	//마이페이지 
	@RequestMapping("/mypage")
	public void mypage() {
		
		
		
		
	}
	

}

