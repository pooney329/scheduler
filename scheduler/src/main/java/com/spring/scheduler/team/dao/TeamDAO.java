package com.spring.scheduler.team.dao;

import java.util.List;
import java.util.Map;

import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.dto.ThumbnailDTO;

public interface TeamDAO {
	//팀 등록
	public int insertTeam(TeamDTO team);
	//팀 썸네일 등록
	public void intsertThumbnail(List<ThumbnailDTO> thumbnail , int tbno);
	//팀리스트 가져오기
	public List<TeamDTO> getList(Map<String,Integer> map);
	//썸네일리스트 가져오기
	public List<ThumbnailDTO> getThumnail(int tbno);
	// 팀 상세정보 가져오기 
	public TeamDTO getTeamDetail(int tbno);
	//초대 신청을 이미 한 회원인지확인
	public boolean getCheckEXISTING_Apply(Map<String, Object> map);
	//이미 팀에 등록된 회원인지 확인 
	public boolean getCheckEXISTING_MEMBER(Map<String, Object> map);
	//팀참여 신청하기 
	public boolean insertTeamApply(int tbno, String uid);
	//팀 참여 대기중인 팀리스트 가져오기 
	public List<TeamDTO> getWaitingTeamList(String uid);
	//myteam의 tab에 해당하는 팀 리스트 가져오기 ex)참여 대기중 , 개설한 팀 , 찜한 팀 ,참여중인팀 ..
	public List<TeamDTO> getTeamListGroup(Map<String , String> map);
}
