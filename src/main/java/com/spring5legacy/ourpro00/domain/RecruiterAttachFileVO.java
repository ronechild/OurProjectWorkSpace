package com.spring5legacy.ourpro00.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RecruiterAttachFileVO { // 구인자가 구인글을 등록할 때 첨부하는 파일 VO
	
	private String bUuid;
	private String bFileName;
	private Long bno;
	private String bDelFlag;
	private String bUploadPath = "C:/myupload";
}