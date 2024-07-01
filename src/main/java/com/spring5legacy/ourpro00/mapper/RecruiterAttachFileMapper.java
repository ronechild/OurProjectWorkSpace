package com.spring5legacy.ourpro00.mapper;

import java.util.List;

import com.spring5legacy.ourpro00.domain.RecruiterAttachFileVO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;

public interface RecruiterAttachFileMapper {
	
	// 특정 구인글의 모든 첨부파일 선택 : 
	public List<RecruiterVO> selectAttachFiles(Long bno);
	
	// 첨부파일 첨부 : 
	public void insertAttachFile(RecruiterAttachFileVO recruiterAttachFile);
	
	// 첨부파일 블라인드 처리 : 
	public void updateAttachFileDelFlag(String bUuid);
	
	// 첨부파일 삭제 : 
	public void deleteAttachFile(String bUuid);
	
	// 첨부파일 모두 삭제 : 
	public void deleteAttachFiles(Long bno);
}