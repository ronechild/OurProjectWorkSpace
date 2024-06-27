package com.spring5legacy.ourpro00.domain;

import java.util.Date;

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
public class CommentVO {
	
	private Long rno;
	private Long bno;
	private String rcontent;
	private String rwriter;
	private Date rregDate;
	private Integer rblind;
}
