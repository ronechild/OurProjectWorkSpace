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
	
	private String buuid;
	private String bfileName;
	private Long bno;
	private String bdelFlag;
	private String buploadPath;
	private String brepoPath = "C:/myupload";
}