package com.spring5legacy.ourpro00.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring5legacy.ourpro00.domain.JobSeekerVO;

public interface JobSeekerMapper {
	
	// 구직글 목록 조회 
	public List<JobSeekerVO> selectJobSeekerList(String awriter);
	
	// 디테일 구직글 목록 조회
	public List<JobSeekerVO> selectJobSeekerListForDetail(Long bno);
	
	// 특정 구직글 조회
	public JobSeekerVO selectJobSeeker(Long ano);
	
	// 구직글 총 수
	public Integer selectRowTotal();
	
	// 구직글 등록
	public Integer insertJobSeeker(JobSeekerVO jobSeeker);
	
	// 특정 구직글 수정
	public int updateJobSeeker(JobSeekerVO jobSeeker);
	public int updateJobSeeker(@Param("ano") Long ano,
														@Param("atitle") String atitle,
														@Param("acontent") String acontent) ;
	
	
	// 특정 구직글 삭제
	public int deleteJobSeeker(Long ano);

		

}
