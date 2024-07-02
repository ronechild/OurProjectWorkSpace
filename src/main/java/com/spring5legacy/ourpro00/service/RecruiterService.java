package com.spring5legacy.ourpro00.service;

<<<<<<< Updated upstream
public interface RecruiterService {

	// 구인글 목록 조회
	public void selectRecruitList();
	
=======
import com.spring5legacy.ourpro00.common.paging.PagingCreatorDTO;
import com.spring5legacy.ourpro00.common.paging.PagingDTO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;

public interface RecruiterService {

	// 구인글 목록 조회
	public PagingCreatorDTO selectRecruitList(PagingDTO pagingCreator);

>>>>>>> Stashed changes
	// 특정 구인글 조회
	public void selectRecruit();
	
	// 구인글 총 수
	public void selectRowTotal();
	
	// 구인글 등록
	public void insertRecruit();
	
	// 특정 구인글 수정
	public void updateRecruit();
	
	// 특정 구인글 블라인드 처리
	public void updateDelFlag();
	
	// 특정 구인글 삭제
	public void deleteRecruit();
}
