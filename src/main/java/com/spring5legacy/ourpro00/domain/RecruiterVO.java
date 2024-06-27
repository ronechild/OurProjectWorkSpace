package com.spring5legacy.ourpro00.domain;

import java.util.Date;

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
public class RecruiterVO {
	
	private Long BNO;
	private String BTITLE;
	private String BCONTENT;
	private String BWRITER;
	private Date BREGDATE;
	private Date BENDDATE;
	private Long BREPLYCNT;
	private Long BAPPCNT;
	private Long BBLIND;
	private String BOCCUPATION;
	private String BREGION;
	private Long BHCNT;
}
