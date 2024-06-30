package com.spring5legacy.ourpro00.mapper;

import java.util.List;

import com.spring5legacy.ourpro00.domain.JobSeekerAttachFileVO;

public interface JobSeekerAttachFileMapper {
	
	// 특정 구인글의 모든 첨부파일 선택 : 
	public List<JobSeekerAttachFileVO> selectAttachFiles(Long ano);
	
	// 첨부파일 첨부 : 
	public void insertAttachFile(JobSeekerAttachFileVO jobSeekerAttachFile);
	
	// 첨부파일 삭제 : 
	public void deleteAttachFile(String auuid);
	
	// 첨부파일 모두 삭제 : 
	public int deleteAttachFiles(Long ano) ;
	
}