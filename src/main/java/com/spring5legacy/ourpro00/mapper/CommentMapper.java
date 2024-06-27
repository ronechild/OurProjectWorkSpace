package com.spring5legacy.ourpro00.mapper;

public interface CommentMapper {
	
	// 특정 구인글의 댓글 목록 조회
	public void selectCommentList();

	// 특정 구인글에 대한 댓글 등록
	public void insertComment();
	
	// 특정 댓글 수정 
	public void updateComment();
	
	// 특정 댓글 삭제
	public void deleteComment();

}