package com.spring5legacy.ourpro00.domain;

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
public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String phone;
	private String mdropFlag;
	private Boolean enabled;
	
	private List<AuthorityVO> authorityList;
}
