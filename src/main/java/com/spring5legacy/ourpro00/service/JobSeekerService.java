package com.spring5legacy.ourpro00.service;

import java.util.List;

import com.spring5legacy.ourpro00.domain.JobSeekerVO;

public interface JobSeekerService {

	// 구직글 목록 조회 
	public List<JobSeekerVO> getJobSeekerList();
	
	// 특정 구직글 조회
	public JobSeekerVO getJobSeeker(Long ano);
	
	// 구직글 총 수
	public void getRowTotal();
	
	// 구직글 등록
	public Long registerJobSeeker(JobSeekerVO jobSeeker);
	
	//특정 구직글 수정페이지
	public JobSeekerVO showModify(Long bno) ;
	
	// 특정 구직글 수정
	public boolean modifyJobSeeker(JobSeekerVO jobSeeker);
	public boolean modifyJobSeeker(Long ano, String atitle, String acontent);
	
	// 특정 구직글 삭제
	//public boolean deleteJobSeeker(Long ano);
	public JobSeekerVO deleteJobSeeker(JobSeekerVO jobSeeker);


	
}
