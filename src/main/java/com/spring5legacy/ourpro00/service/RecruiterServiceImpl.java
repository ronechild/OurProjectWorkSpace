package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring5legacy.ourpro00.common.paging.PagingCreatorDTO;
import com.spring5legacy.ourpro00.common.paging.PagingDTO;
import com.spring5legacy.ourpro00.domain.RecruiterAttachFileVO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.mapper.RecruiterAttachFileMapper;
import com.spring5legacy.ourpro00.mapper.RecruiterMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RecruiterServiceImpl implements RecruiterService {

	private RecruiterMapper recruiterMapper;
	private RecruiterAttachFileMapper recruiterAttachFileMapper;

	// 구인글 목록 조회
	@Override
	public PagingCreatorDTO selectRecruitList(PagingDTO paging) {
		System.out.println("서비스:::구인글 목록 조회 : ");

		return new PagingCreatorDTO(paging, recruiterMapper.selectRowTotal(paging),
				recruiterMapper.selectRecruitList(paging));
	}

	// 특정 구인글 조회
	@Override
	public RecruiterVO selectRecruit(Long bno) {
		System.out.println("서비스:::특정 구인글 조회 : " + bno);
		RecruiterVO recruiterVO = recruiterMapper.selectRecruit(bno);
		System.out.println(bno + "번 글 호출 완료");
		return recruiterVO;
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

		if (attachFileList != null && 0 < attachFileList.size()) {
			for (RecruiterAttachFileVO attachFile : attachFileList) {
				attachFile.setBno(recruiterVO.getBno());
				recruiterAttachFileMapper.insertAttachFile(attachFile);
				System.out.println("\t" + "\t" + "첨부한 파일 이름 : " + attachFile.getBfileName());
			}
		}

		System.out.println("\t" + recruiterVO.getBno() + "번 글 등록 완료");
	}

	// 특정 구인글 수정 + 첨부파일
	@Override
	public void updateRecruit(RecruiterVO recruiterVO) {
		System.out.println("서비스:::구인글 수정 : ");

		System.out.println("서비스:::recruiterVO : " + recruiterVO);

		recruiterMapper.updateRecruit(recruiterVO);

		boolean updated = recruiterMapper.updateRecruit(recruiterVO) == 1;

		recruiterAttachFileMapper.deleteAttachFiles(recruiterVO.getBno());

		List<RecruiterAttachFileVO> attachFileList = recruiterVO.getAttachFileList();

		if (updated) {
			for (RecruiterAttachFileVO attachFile : attachFileList) {
				attachFile.setBno(recruiterVO.getBno());
				recruiterAttachFileMapper.insertAttachFile(attachFile);
				System.out.println("\t" + "\t" + "첨부한 파일 이름 : " + attachFile.getBfileName());
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

	public String findRecruiter(String userid) {
		return recruiterMapper.findRecruiter(userid);

	}
}