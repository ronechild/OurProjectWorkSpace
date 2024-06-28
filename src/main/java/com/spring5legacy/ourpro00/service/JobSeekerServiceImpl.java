package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.mapper.JobSeekerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class JobSeekerServiceImpl implements JobSeekerService{
	
	private JobSeekerMapper jobSeekerMapper ;

	// 구직글 목록 조회 
	@Override
	public List<JobSeekerVO> getJobSeekerList() {
		System.out.println("구직글 목록");
		return jobSeekerMapper.selectJobSeekerList();
	}

	// 특정 구직글 조회
	@Override
	public JobSeekerVO getJobSeeker(Long ano) {
			System.out.println("받은 ano: " + ano);
			JobSeekerVO jobSeeker = jobSeekerMapper.selectJobSeeker(ano) ;
			
			return jobSeeker;
	}
		
		// 구직글 총 수
	@Override
		public void getRowTotal() {
			System.out.println("구직글 총 수" + jobSeekerMapper.selectRowTotal());
			jobSeekerMapper.selectRowTotal() ;
		}
		
		// 구직글 등록
	@Override
		public Long registerJobSeeker(JobSeekerVO jobSeeker) {
			System.out.println("등록 전달 jobSeeker: " + jobSeeker);
			jobSeekerMapper.insertJobSeeker(jobSeeker) ;
			System.out.println("등록 후 jobSeeker: " + jobSeeker);
			return jobSeeker.getAno();
		}
		
		// 특정 구직글 수정
	@Override
		public boolean modifyJobSeeker(Long ano, String atitle, String acontent) {
			System.out.println("수정 메서드에 전달된 값들" + ano + ", " + atitle + ", " + acontent);
			return jobSeekerMapper.updateJobSeeker(ano, atitle, acontent) == 1;
		}
		

		@Override
		public boolean modifyJobSeeker(JobSeekerVO jobSeeker) {
			System.out.println("서비스: 게시물 수정 메서드에 전달된 VO: " + jobSeeker);
		
			boolean modifyResult = jobSeekerMapper.updateJobSeeker(jobSeeker) == 1;
			
			return modifyResult ;
		}
		
		// 특정 구직글 삭제
		@Override
		public boolean deleteJobSeeker(Long ano) {
			System.out.println("게시물 삭제 ano: " + ano);
			return jobSeekerMapper.deleteJobSeeker(ano) == 1;
		}


}
