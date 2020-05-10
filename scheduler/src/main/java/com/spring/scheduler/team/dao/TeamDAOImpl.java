package com.spring.scheduler.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.dto.ThumbnailDTO;
import com.spring.scheduler.user.dao.UserDAOImpl;
import com.spring.scheduler.user.dto.ProFileImg;


@Repository
public class TeamDAOImpl implements TeamDAO {
	private static final String NS = "team."; //네임스페이스
	private static final String INSERTTEAM = NS+"insertteam"; //팀등록
	private static final String INSERTMEMBER = NS+"insertmember";  //멤버등록
	private static final String INSERTTHUMBNAIL = NS+ "insertthumbnail"; //팀 썸네일 등록
	private static final String TEAMLIST = NS+"teamlist"; //팀리스트 가져오기
	private static final String SELECTTHUMBNAIL = NS+"selectthumbnail"; //팀썸네일 가져오기
	private static final String SELECTTEAMDETAIL = NS+"selectteamdetail"; //팀상세정보 가져오기
	private static final String SELECTEXISTINGAPPLY = NS+"selectexistingapply"; //기존에 팀에 참여 신청을 했는지 확인
	private static final String SELECTEXISTINGMEMBER = NS+"selectexistingmember"; //팀에 이미 등록된 회원인지 확인
	private static final String INSERTTEAMAPPLY = NS+"insertteamapply"; //팀에 참여신청하기
	
	
	
	
	
	
	
	
	@Inject
	SqlSession sqlSession;
	
	
	//팀등록
	@Override
	public int insertTeam(TeamDTO team) {
		
		
		boolean check = sqlSession.insert(INSERTTEAM,team) == 1? true :false;  // 등록 성공 
		
		if(check == true) { // 등록실패
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("tbno",team.getTbno());
			map.put("uid",team.getTeamMaster());
			map.put("authority","master");
			
			sqlSession.insert(INSERTMEMBER,map);
			
		}
		
				
		
		
		
		
		return team.getTbno();
		
		

	}
	//팀 썸네일 등록
	@Override
	public void intsertThumbnail(List<ThumbnailDTO> thumbnail, int tbno) {
		thumbnail.forEach(thum -> {
			thum.setTbno(tbno);
			sqlSession.insert(INSERTTHUMBNAIL,thum);
			});
		
		
	}
	@Override
	public List<TeamDTO> getList(Map<String,Integer> map) {
		 //레코드 16를 기준으로 가져온다 
		 int scrollCount = map.get("scrollCount"); 
		 int start = scrollCount * 16 + scrollCount;
		 int end = start == 0 ? start +16 :start +16 -1;
		 
		 map = new HashMap<String, Integer>();
		 map.put("start",start);
		 map.put("end",end);		 
		 
		 List<TeamDTO> teamList = sqlSession.selectList(TEAMLIST, map);
		
		teamList.forEach(team -> {
			
			int tbno = team.getTbno();
			List<ThumbnailDTO> thumbnailList = sqlSession.selectList(SELECTTHUMBNAIL,tbno);
			
			
			
			if(!thumbnailList.isEmpty()) {
				
				team.setThumbnailList(thumbnailList);
			}
			
			
			
		});
		
		
		return teamList;
	}
	@Override
	public List<ThumbnailDTO> getThumnail(int tIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//팀 상세정보 가져오기 
	@Override
	public TeamDTO getTeamDetail(int tbno) {
		
		
		//팀 디테일 정보 가져오기 
		TeamDTO team  = sqlSession.selectOne(SELECTTEAMDETAIL, tbno);
		
		
		//팀 썸네일 가져오기 
		List<ThumbnailDTO> thumbnailList = sqlSession.selectList(SELECTTHUMBNAIL , tbno);
		//썸네일이 존재 한다면 TeamDTO객체에 썸네일리스트 추가하기 
		if(!thumbnailList.isEmpty()) {
			team.setThumbnailList(thumbnailList);
			
		}
		
		//방장의 프로필 사진 가져오기
		ProFileImg profileimg = sqlSession.selectOne(UserDAOImpl.SELECTPROFILEIMG, team.getTeamMaster());
		team.setProFileImg(profileimg);
		
		
		
		return team;
				
	}
	@Override
	public boolean getCheckEXISTING_Apply(Map<String, Object> map) {
		boolean check = sqlSession.selectOne(SELECTEXISTINGAPPLY, map) == null ? false :true;
		return check;
	}
	@Override
	public boolean getCheckEXISTING_MEMBER(Map<String, Object> map) {
		boolean check = sqlSession.selectOne(SELECTEXISTINGMEMBER, map) == null ? false :true;
		return check;
	}
	@Override
	public boolean insertTeamApply(int tbno, String uid) {
		Map <String , Object> map  =  new HashMap<String, Object>();
		map.put("tbno", tbno);
		map.put("uid", uid);
		//팀참여신청 추가 
		boolean teamApplyCheck = sqlSession.insert(INSERTTEAMAPPLY,map)==1 ? true:false; 
		return teamApplyCheck;
	}
	@Override
	public List<TeamDTO> getWaitingTeamList(String uid) {
		List<TeamDTO> list = sqlSession.selectList("team.selectwaitingteamlist" , uid);
		
		return list;
	}
	@Override
	public List<TeamDTO> getTeamListGroup(Map<String , String> map) {
		List<TeamDTO> teamlistgroup =  sqlSession.selectList("team.selectteamlistgroup", map);
		
		
		return teamlistgroup;
	}
	
	

}
