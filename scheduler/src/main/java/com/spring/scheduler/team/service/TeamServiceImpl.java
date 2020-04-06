package com.spring.scheduler.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.scheduler.team.dao.TeamDAO;
import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.dto.ThumbnailDTO;

@Service
public class TeamServiceImpl implements TeamService {
	@Inject
	TeamDAO teamDao;
	
	
	//팀등록 
	@Transactional
	@Override
	public void insertTeam(TeamDTO team) {
		
		//팀등록 후 tidx값 가져오기 
		int tIdx = teamDao.insertTeam(team);
		
		
		//팀 썸네일 등록
		if (team.getThumbnailList() != null) {
			teamDao.intsertThumbnail(team.getThumbnailList(),tIdx);
		}
	}

	//팀리스트 가져오기
	@Override
	public List<TeamDTO> getList() {
		
		return teamDao.getList();
	}


	@Override
	public List<ThumbnailDTO> getThumnail(int tbno) {
		// TODO Auto-generated method stub
		return null;
	}

}
