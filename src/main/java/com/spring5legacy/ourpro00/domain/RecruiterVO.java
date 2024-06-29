package com.spring5legacy.ourpro00.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RecruiterVO {

	private Long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bregDate; // 등록일
	private Date bendDate; // 마감일
	private Integer breplyCnt; // 게시물의 댓글+답글 수
	private Integer bappCnt; // 지원 신청 수
	private Integer bblind;  // 블라인드
	private String boccupation; // 직종 (default : null)
	private String bregion; // 지역 (default : null)
	private Integer bhcnt; // 모집인원(?)
	
	private List<RecruiterAttachFileVO> attachFileList;
}
