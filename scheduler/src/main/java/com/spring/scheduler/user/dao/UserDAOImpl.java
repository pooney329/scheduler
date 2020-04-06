package com.spring.scheduler.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.scheduler.user.dto.UserDTO;
import com.spring.scheduler.user.service.UserService;

@Repository
public class UserDAOImpl implements UserDAO {
	private static final String NS = "user."; //네임스페이스 
	private static final String CHECKUSER = NS+"checkuser"; //로그인창에서 ajax를 통해 아이디 비번이 올바른지 확인 맞으면 true ,그렇지 않으면 fasle
	private static final String ACTIONLOGIN = NS+"actionlogin"; //로그인창에서 ajax를 통해 true인 경우 로그인 진행하기 위하여 db에서 회원정보가져온다
	private static final String SNSLOGIN = NS+"snslogin" ;  // sns유저 확인 후 로그인
	private static final String CHECKID = NS+"checkid" ;  // 아이디중복확인
	private static final String EMAILAUTH  = NS+"emailauth" ;  // 이메일 인증 
	private static final String ACTIONJOIN  = NS+"actionjoin" ;  // 회원가입
	private static final String UPDATEEMAILAAUTH  = NS + "updateemailaauth"; //이메일 인증 여부 Y로 바꾸기
	private static final String CHECKEMAILAAUTH  = NS + "checkemailaauth"; //이메일 인증 정보 일치 여부 확인
	private static final String SELECTEMAILAUTH  = NS + "selectemailauth"; //이메일 인증 정보 Y인지 확인
	private static final String EMAILAUTHDUPLICATE  = NS + "emailauthduplicate"; //이메일 인증 의 이메일 중복확인
	private static final String EMAILAUTHIDUPDATE  = NS + "emailauthidupdate"; //이메일 인증 아이디 변경
	
	
	
	@Inject
	SqlSession sqlSession;  
	
	
	
	@Override
	public Map<String, Boolean> checkUser(UserDTO user) {
		Map<String, Boolean> map =new HashMap<String, Boolean>();
		boolean is_userd = (int) sqlSession.selectOne(CHECKUSER,user)==1? true:false;
		if(is_userd) {
			boolean is_emailauth = (boolean)sqlSession.selectOne(SELECTEMAILAUTH, user.getUid()).equals("Y")? true:false;
			map.put("is_emailauth",is_emailauth);
		}
		map.put("is_userd",is_userd);
		return map;
	}


	@Override
	public UserDTO actionLogin(UserDTO user) {
		
		return sqlSession.selectOne(ACTIONLOGIN, user);
	}
	public void soo() {
		System.out.println("시작됨");
		List<UserDTO> list = sqlSession.selectList("member.lolo");
		System.out.println("에러남");
		//System.out.println(list.get(0).getUid());
	}


	@Override
	public UserDTO snsCheck(UserDTO user) {
		Map<String , Object> map  = new HashMap<String, Object>();
		if(StringUtils.isEmpty(user.getGoogleid())){
			map.put("snsname","naver");
			map.put("user", user);
		}
		else {
			map.put("snsname","google");
			map.put("user", user);
		}
		return sqlSession.selectOne(SNSLOGIN,map);
	}


	@Override
	public boolean checkId(String uid) {
		boolean checkid =  (int)sqlSession.selectOne(CHECKID,uid)==1? true : false;
		
		return checkid;
	}


	@Override
	public void insertEmailAuth(String key, String uid) {
		Map<String ,String> map = new HashMap<String, String>();
		map.put("key",key);
		map.put("uid",uid);
		sqlSession.update(EMAILAUTH,map);
		
	}


	@Override
	public void actionJoin(UserDTO user) {
		System.out.println(user);
		sqlSession.insert(ACTIONJOIN,user);
		
	}


	

	@Override
	public void updateEmailaAuth(String uid) {
		sqlSession.update(UPDATEEMAILAAUTH,uid);
		
	}


	@Override
	public boolean checkEmailaAuth(String uid, String key) {
		Map<String, String > map = new HashMap<String, String>();
		map.put("uid",uid);
		map.put("key",key);
		boolean checkemailauth = (int)sqlSession.selectOne(CHECKEMAILAAUTH, map)==1? true: false;
		
		return checkemailauth;
	}


	@Override
	public boolean emailAuthDuplicate(Map<String, String> map) {
		
		return (int)sqlSession.selectOne(EMAILAUTHDUPLICATE,map) == 1 ? true : false;
	}


	@Override
	public boolean emailAuthIdUpdate(Map<String, String> map) {
		
		return sqlSession.update(EMAILAUTHIDUPDATE,map) ==1? true: false;
	}

}
