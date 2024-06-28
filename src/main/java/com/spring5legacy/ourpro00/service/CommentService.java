package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring5legacy.ourpro00.domain.CommentVO;

public interface CommentService {
	
	// 특정 구인글의 댓글 목록 조회
	public List<CommentVO> selectCommentList(Long bno);

	// 특정 구인글에 대한 댓글 등록
	public Long insertComment(CommentVO comment);
	
	// 특정 댓글 수정
	public Boolean updateComment(CommentVO comment);
	
	// 특정 댓글 삭제
	public String deleteComment(Long bno, Long rno);
	
}
