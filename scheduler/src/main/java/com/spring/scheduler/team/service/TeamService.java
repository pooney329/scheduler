package com.spring.scheduler.team.service;

import java.util.List;
import java.util.Map;

import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.dto.ThumbnailDTO;

public interface TeamService {
	
	//팀등록하기 
	public void insertTeam(TeamDTO team); 

	// 팀리스트 가져오기
	public List<TeamDTO> getList(Map<String,Integer> map);

	// 팀썸네일 가져오기
	public List<ThumbnailDTO> getThumnail(int tbno);
	
	// 팀 상세정보 가져오기 
	public TeamDTO getTeamDetail(int tbno);
	
	
	//초대 신청을 이미 한 회원인지  아니면 이미 팀에 등록된 회원인지 확인 
	public String getCheckApply(Map<String, Object> map);
	//팀참여 신청하기 
	public boolean insertTeamApply(int tbno, String uid);

}
