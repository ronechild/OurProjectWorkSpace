package com.spring5legacy.ourpro00.mapper;

import java.util.List;

import com.spring5legacy.ourpro00.domain.RecruiterVO;

public interface RecruiterMapper {

	// 구인글 목록 조회
	public List<RecruiterMapper> selectRecruitList();
	
	// 특정 구인글 조회
	public void selectRecruit();
	
	// 구인글 총 수
	public void selectRowTotal();
	
	// 구인글 등록
	public void insertRecruit();
	
	// 특정 구인글 수정
	public void updateRecruit();
	
	// 특정 구인글 블라인드 처리
	public void updateDelFlag();
	
	// 특정 구인글 삭제
	public void deleteRecruit();
}
