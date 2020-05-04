package com.spring.scheduler.team.service;

import java.util.List;
import java.util.Map;

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
	public List<TeamDTO> getList(Map<String,Integer> map) {
		
		return teamDao.getList(map);
	}


	@Override
	public List<ThumbnailDTO> getThumnail(int tbno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TeamDTO getTeamDetail(int tbno) {
		
		return teamDao.getTeamDetail(tbno); 
				
	}

	@Override
	public String getCheckApply(Map<String, Object> map) {
		
		//기존 팀의 회원인지 확인
		boolean member_existence=  teamDao.getCheckEXISTING_MEMBER(map);
		
		//기존 팀의 회원인경우 
		if(member_existence) {
			return "member";
			
		}else {
			
			//기존이 팀에 참여신청을 했는지 확인 
			boolean apply_existence = teamDao.getCheckEXISTING_Apply(map);
			
			//기존에 팀에 참여신청을 한경우 
			if(apply_existence) {
				return "apply";
			}
			else{
				return null;
	
			}
			
		}
		
		
	}

	@Override
	public boolean insertTeamApply(int tbno, String uid) {
		
		return teamDao.insertTeamApply(tbno, uid);
	}

	

}
