package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring5legacy.ourpro00.domain.RecruiterAttachFileVO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.mapper.RecruiterAttachFileMapper;
import com.spring5legacy.ourpro00.mapper.RecruiterMapper;

@Service
public class RecruiterServiceImpl implements RecruiterService{
	
	private RecruiterMapper recruiterMapper;
	private RecruiterAttachFileMapper recruiterAttachFileMapper;
	
	
	// 구인글 목록 조회
	@Override
	public RecruiterVO selectRecruitList(RecruiterVO recruiterVO) {
		System.out.println("서비스:::구인글 목록 조회 : ");
		return new RecruiterVO();
	}

	// 특정 구인글 조회
	@Override
	public void selectRecruit(Long bno) {
		System.out.println("서비스:::특정 구인글 조회 : ");
		recruiterMapper.selectRecruit(bno);
		System.out.println("\t" + bno + "번 글 호출 완료");
	}

	// 구인글 총 수
	@Override
	public void selectRowTotal() {
		recruiterMapper.selectRowTotal();
	}

	// 구인글 등록 + 첨부파일
	@Override
	public void insertRecruit(RecruiterVO recruiterVO) {
		System.out.println("서비스:::구인글 등록 : ");
		recruiterMapper.insertRecruit(recruiterVO);
		
		// 첨부파일 등록 : 
		List<RecruiterAttachFileVO> attachFileList = recruiterVO.getAttachFileList();
		
		if(attachFileList != null && 0 < attachFileList.size()) {
			for(RecruiterAttachFileVO attachFile : attachFileList) {
				attachFile.setBno(recruiterVO.getBno());
				recruiterAttachFileMapper.instertAttachFile(attachFile);
				System.out.println("\t" + "\t" + "첨부한 파일 이름 : " + attachFile.getBFileName());
			}
		}
		
		System.out.println("\t" + recruiterVO.getBno() + "번 글 등록 완료");
	}

	// 특정 구인글 수정 + 첨부파일
	@Override
	public void updateRecruit(RecruiterVO recruiterVO) {
		System.out.println("서비스:::구인글 수정 : ");
		recruiterMapper.updateRecruit(recruiterVO);
		
		boolean updated = recruiterMapper.updateRecruit(recruiterVO) == 1; // 수정 여부 : 1
		
		// 첨부파일 처리 : 
		recruiterAttachFileMapper.deleteAttachFiles(recruiterVO.getBno());
		
		List<RecruiterAttachFileVO> attachFileList = recruiterVO.getAttachFileList();
				
		if(updated) { // 수정 시, 첨부파일 모두 삭제하고, 수정완료 버튼을 눌렀을 때에도 작동해야함 > attachFileList != null 삭제
			for(RecruiterAttachFileVO attachFile : attachFileList) {
				attachFile.setBno(recruiterVO.getBno());
				recruiterAttachFileMapper.instertAttachFile(attachFile);
				System.out.println("\t" + "\t" + "첨부한 파일 이름 : " + attachFile.getBFileName());
			}
		}
		
		System.out.println("\t" + recruiterVO.getBno() + "번 글 수정 완료");
	}
	
	// 특정 구인글 블라인드 처리
	@Override
	public void updateDelFlag(Long bno) {
		System.out.println("서비스:::구인글 블라인드 처리 : ");
		recruiterMapper.updateDelFlag(bno);
		System.out.println("\t" + bno + "번 글 블라인드 처리 완료");
	}

	// 특정 구인글 삭제
	@Override
	public void deleteRecruit(Long bno) {
		System.out.println("서비스:::구인글 삭제 : ");
		recruiterMapper.deleteRecruit(bno);
		System.out.println("\t" + bno + "번 글 삭제 완료");
	}
}