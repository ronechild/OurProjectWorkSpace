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
public class JobSeekerAttachFileVO {
	
	private String Uuid;
	private String FileName;
	private String UploadPath;
	private Long ano;
	private String fileType ;
	private String RepoPath = "C:/myupload";
}