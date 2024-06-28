package com.spring5legacy.ourpro00.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring5legacy.ourpro00.domain.CommentVO;

public interface CommentMapper {
	
	// 특정 구인글의 댓글 목록 조회
	public List<CommentVO> selectCommentList(Long bno);

	// 특정 구인글에 대한 댓글 등록
	public Long insertComment(CommentVO comment);
	
	// 특정 댓글 수정 
	public Integer updateComment(CommentVO comment);
	
	// 특정 댓글 삭제
	public Integer deleteComment(@Param("bno") Long bno, @Param("rno") Long rno);



}