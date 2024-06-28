package com.spring5legacy.ourpro00.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring5legacy.ourpro00.domain.CommentVO;
import com.spring5legacy.ourpro00.service.CommentService;

import lombok.AllArgsConstructor;

@RestController
//@AllArgsConstructor
@RequestMapping(value = {"/comments"})
public class CommentController {
	
	private CommentService commentService ;
	
	public CommentController(CommentService commentService) {
		this.commentService = commentService ;
	}
	
	
	// 특정 구인글의 댓글 목록 조회
	
	@GetMapping(value = "")
	public ResponseEntity<CommentVO>  selectCommentList(@PathVariable("bno") Long bno){
		
		commentService.selectCommentList(bno);
		
		return null ;
	}
	
	
	
	
	// 특정 구인글에 대한 댓글 등록
	@PostMapping(value = "/{bno}")
	public ResponseEntity<String>  insertComment(@PathVariable("bno") Long bno, @RequestBody CommentVO comment) {
		
		Long insertRno = commentService.insertComment(comment) ;
		String _insertRno = null ;
		
		
		  if(insertRno != null) { _insertRno = String.valueOf(insertRno) ;
		  
		  }
		 
		
		
		
		  return insertRno != null ? new ResponseEntity<String>(_insertRno,	  HttpStatus.OK) 
				  										: new ResponseEntity<String>(_insertRno,HttpStatus.INTERNAL_SERVER_ERROR) ;
		 
		
	}
	
	
	// 특정 댓글 수정
	@PatchMapping(value = "/{bno}/{rno}")
	public ResponseEntity<String> updateComment(@RequestBody CommentVO comment, 
																							  @PathVariable("bno") Long bno, 
																							  @PathVariable("rno") Long rno) {
		
		return new ResponseEntity<String>("updateSuccess", HttpStatus.OK) ;
	}

	
	// 특정 댓글 삭제
	
	@DeleteMapping(value = "/{bno}/{rno}")
	public ResponseEntity<String> deleteComment( @PathVariable("bno") Long bno,  @PathVariable("rno") Long rno) {
		
		return new ResponseEntity<String>(commentService.deleteComment(bno, rno), HttpStatus.OK) ;	
	}
	
	
	
}
