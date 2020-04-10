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

}
