package com.spring5legacy.ourpro00.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring5legacy.ourpro00.domain.MemberVO;

import lombok.Getter;

@Getter
public class MemberUser  extends User{
	
	private static final long serialVersionUID = 1L;
	private MemberVO member;
	
	public MemberUser(MemberVO member) {
		super(member.getUserid(), member.getUserpw(), 
				    member.getAuthorityList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
				   .collect(Collectors.toList())
				);
		
		this.member = member;
	}

}
