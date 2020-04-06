package com.spring.scheduler.team.dao;

import java.util.List;

import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.dto.ThumbnailDTO;

public interface TeamDAO {
	//팀 등록
	public int insertTeam(TeamDTO team);
	//팀 썸네일 등록
	public void intsertThumbnail(List<ThumbnailDTO> thumbnail , int tbno);
	//팀리스트 가져오기
	public List<TeamDTO> getList();
	//썸네일리스트 가져오기
	public List<ThumbnailDTO> getThumnail(int tbno);

}
