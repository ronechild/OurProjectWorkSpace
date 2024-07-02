package com.spring5legacy.ourpro00.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class JobSeekerServiceImpl implements JobSeekerService{

	// 구직글 목록 조회 
	@Override
	public void selectJobSeekerList() {
		
	}

	// 특정 구직글 조회
	@Override
<<<<<<< Updated upstream
	public void selectJobSeeker() {
		
=======
	public JobSeekerVO getJobSeeker(Long ano) {
			System.out.println("받은 ano: " + ano);
			JobSeekerVO jobSeeker = jobSeekerMapper.selectJobSeeker(ano) ;
			List<JobSeekerAttachFileVO> jobSeekerAttachFileList = jobSeekerAttachFileMapper.selectAttachFiles(ano) ;
			jobSeeker.setJobSeekerAttachFileList(jobSeekerAttachFileList);
			return jobSeeker;
>>>>>>> Stashed changes
	}

	// 구직글 총 수
	@Override
	public void selectRowTotal() {
		
	}

	// 구직글 등록
	@Override
	public void insertJobSeeker() {
		
	}

	// 특정 구직글 수정
	@Override
	public void updateJobSeeker() {
		
	}

	// 특정 구직글 블라인드 처리
	@Override
	public void updateDelFlag() {
		
	}

	// 특정 구직글 삭제
	@Override
	public void deleteJobSeeker() {
		
	}

}
