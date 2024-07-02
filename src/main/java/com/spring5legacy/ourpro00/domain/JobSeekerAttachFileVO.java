package com.spring5legacy.ourpro00.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class JobSeekerAttachFileVO { // 구인자가 구인글을 등록할 때 첨부하는 파일 VO
	
	private String Uuid;
	private String FileName;
	private String UploadPath;
	private Long ano;
	private String fileType ;
	private String RepoPath = "C:/myupload";
}