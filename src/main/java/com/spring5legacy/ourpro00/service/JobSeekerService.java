package com.spring5legacy.ourpro00.service;

public interface JobSeekerService {

	// 구직글 목록 조회 
	public void selectJobSeekerList();
	
	// 특정 구직글 조회
	public void selectJobSeeker();
	
	// 구직글 총 수
	public void selectRowTotal();
	
	// 구직글 등록
	public void insertJobSeeker();
	
	// 특정 구직글 수정
	public void updateJobSeeker();
	
	// 특정 구직글 블라인드 처리
	public void updateDelFlag();
	
	// 특정 구직글 삭제
	public void deleteJobSeeker();
	
}
