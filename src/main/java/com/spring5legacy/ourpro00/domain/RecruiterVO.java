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
//@AllArgsConstructor
@NoArgsConstructor
public class RecruiterVO {

	private Long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bregDate;
	private Date bendDate;
	private Integer breplyCnt;
	private Integer bappCnt;
	private Integer bblind; 
	private String boccupation;
	private String bregion;
	private Integer bhcnt;
	
	private List<RecruiterAttachFileVO> attachFileList;
}
