package com.spring.scheduler.team.dto;

import java.util.List;

import com.spring.scheduler.user.dto.ProFileImg;

import lombok.Data;


@Data
public class TeamDTO {
	
	private String teamMaster;//방장아이디
	private String masterName;//방장이름
	private String teamIntroduce;  //팀소개
	private String teamName;  //팀이름
	private String category; //팀카테고리
	private String teamContent; //팀 내용
	private String teamHashTag; //팀 해쉬태그
	private String participants; //참여인원 수 
	private String allowSearch;  // 검색 노출 허용 여부
	private String thumbnailExistence;  //썸네일 존재 여부 
	private String startDay; //개설시간;
	private String endDay; //마감시간;
	private List<ThumbnailDTO> thumbnailList =null ; //대표썸네일 , 백그라운드 썸네일
	
	private int tbno; //게시물 번호
	private int num;  //참여 중인 팀 원수 
	private ProFileImg proFileImg=null ; //방장의 프로필 사진 
	
	
	
	
	
}

