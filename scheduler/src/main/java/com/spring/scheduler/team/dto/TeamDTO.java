package com.spring.scheduler.team.dto;

import java.util.List;

import lombok.Data;


@Data
public class TeamDTO {
	
	private String teamMaster;//방장
	private String teamIntroduce;  //팀소개
	private String teamName;  //팀이름
	private String category; //팀카테고리
	private String teamContent; //팀 내용
	private String teamHashTag; //팀 해쉬태그
	private String participants; //참여인원 수 
	private String allowSearch;  // 검색 노출 허용 여부
	private String thumbnailExistence;  //썸네일 존재 여부 
	private List<ThumbnailDTO> thumbnailList =null ; //대표썸네일 , 백그라운드 썸네일
	private String master; // 방장
	private int tbno; //게시물 번호
	private int num;  //참여 중인 팀 원수 
	
	
	
	
	
	
}
