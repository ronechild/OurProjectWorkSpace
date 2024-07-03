package com.spring5legacy.ourpro00.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RecruiterAttachFileVO {
	
	private String bUuid;
	private String bFileName;
	private Long bno;
	private String bDelFlag;
	private String bUploadPath;
	private String bRepoPath = "C:/myupload";
}