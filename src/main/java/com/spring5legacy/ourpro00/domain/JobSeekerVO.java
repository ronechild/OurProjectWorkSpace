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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JobSeekerVO {
	
	private Long ano ;
	private String atitle; 
	private String acontent;
	private String awriter;
	private Date aregdate;
	private Long bno;
	
	private List<JobSeekerAttachFileVO> jobSeekerAttachFileList ;
	
	private Integer deletedAttachFileCnt;
}
