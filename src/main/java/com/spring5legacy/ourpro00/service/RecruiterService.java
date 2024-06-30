package com.spring5legacy.ourpro00.service;

import java.util.List;

import com.spring5legacy.ourpro00.domain.RecruiterVO;

public interface RecruiterService {

	// 구인글 목록 조회
	public List<RecruiterVO> selectRecruitList(RecruiterVO recruiter);
	
	// 특정 구인글 조회
	public RecruiterVO selectRecruit(Long bno);
	
	// 구인글 총 수
	public void selectRowTotal();
	
	// 구인글 등록
	public void insertRecruit(RecruiterVO recruiterVO);
	
	// 특정 구인글 수정
	public void updateRecruit(RecruiterVO recruiterVO);
	
	// 특정 구인글 블라인드 처리
	public void updateDelFlag(Long bno);
	
	// 특정 구인글 삭제
	public void deleteRecruit(Long bno);
	
	// *
	// userid의 username을 찾기
	public String findRecruiter(String userid);
}
