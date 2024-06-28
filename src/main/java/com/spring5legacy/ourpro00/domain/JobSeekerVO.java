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
public class JobSeekerVO {

	private Long ano;
	private Long bno;
	private String atitle;
	private String acontent;
	private String awriter;
	private Date aregDate;
	
	private List<JobSeekerAttachFileVO> jobSeekerAttachFileList ;
	
	private Integer deletedAttachFileCnt;
}
