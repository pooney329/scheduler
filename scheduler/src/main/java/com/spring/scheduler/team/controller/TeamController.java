package com.spring.scheduler.team.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.scheduler.team.dto.TeamDTO;
import com.spring.scheduler.team.service.TeamService;
import com.spring.scheduler.user.dto.UserDTO;
import com.spring.scheduler.user.interceptor.SessionAttr;

@Controller
@RequestMapping("/team/*")
public class TeamController {
	
	
	@Inject
	TeamService teamService;
	//팀등록 페이지 이동 
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public void teamRegister() {
		
	}
	//팀등록 
	@RequestMapping(value="/register" , method = RequestMethod.POST)
	public String teamRegisteAction(TeamDTO team, HttpSession session) {
		UserDTO user  = (UserDTO)session.getAttribute(SessionAttr.LOGINUSER);
		team.setTeamMaster(user.getUid());
			
			
		teamService.insertTeam(team);
		
		
		
		return "list";
		
	}
	//팀리스트보여주기
	@RequestMapping(value="/teamlist", method=RequestMethod.GET)
	public void teamlist(Model model) {
		
		
		 
		/*
		 * List<TeamDTO> teamlist = teamService.getList(); System.out.println(teamlist);
		 * model.addAttribute("list", teamlist);
		 */
		
		
		
	}

	//팀 상세 정보 보기 
	@RequestMapping(value="/teamdetail" , method=RequestMethod.GET)
	public void teamdetail (@RequestParam int tbno, Model model) {
		TeamDTO team = teamService.getTeamDetail(tbno);
		model.addAttribute("team", team);
		
	}
	
	
	//무한스크롤 요청 
	@ResponseBody
	@RequestMapping(value="/teamlist", method = RequestMethod.POST)
	public List<TeamDTO> teamlist(@RequestBody Map<String,Integer> map) {
		 
		
		return teamService.getList(map);
		
		
	}

}
