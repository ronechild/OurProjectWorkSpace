package com.spring5legacy.ourpro00.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring5legacy.ourpro00.domain.CommentVO;
import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.mapper.CommentMapper;
import com.spring5legacy.ourpro00.mapper.JobSeekerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {

	private CommentMapper commentMapper;
	private JobSeekerMapper jobSeekerMapper;

	// 특정 구인글의 댓글 목록 조회
	@Override
	public List<CommentVO> selectCommentList(Long bno) {

		List<CommentVO> commentList = commentMapper.selectCommentList(bno);

		return commentList;
	}

	// 특정 구인글의 이력서 목록 조회
	@Override
	public List<JobSeekerVO> selectAppliList(Long bno) {

		List<JobSeekerVO> appliList = jobSeekerMapper.selectJobSeekerListForDetail(bno);

		return appliList;
	}

	// 특정 구인글에 대한 댓글 등록
	@Override
	@Transactional
	public Long insertComment(CommentVO comment) {
		commentMapper.insertComment(comment);
		return comment.getRno();
	}

	// 특정 댓글 수정
	@Override
	public Boolean updateComment(CommentVO comment) {

		return commentMapper.updateComment(comment) == 1;

	}

	// 특정 댓글 블라인드
	@Override
	public String blindComment(Long bno, Long rno) {
		Integer blindRowCnt = commentMapper.blindComment(bno, rno);
		String _blindRowCnt = null;

		if (blindRowCnt != null) {
			_blindRowCnt = String.valueOf(blindRowCnt);
		}

		return _blindRowCnt;

	}

	// 특정 댓글 삭제
	@Override
	@Transactional
	public String deleteComment(Long bno, Long rno) {

		Integer deletedRowCnt = commentMapper.deleteComment(bno, rno);
		String _deletedRowCnt = null;

		if (deletedRowCnt != null) {
			_deletedRowCnt = String.valueOf(deletedRowCnt);
		}

		return _deletedRowCnt;

	}

}
