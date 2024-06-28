package com.spring5legacy.ourpro00.common.security;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring5legacy.ourpro00.domain.MemberVO;
import com.spring5legacy.ourpro00.mapper.MemberMapper;

public class MemberDetailsService  implements UserDetailsService{
	
	private MemberMapper memberMapper;
	
	@Autowired
	public void setMemberMapper(MemberMapper memberMapper) {
		System.out.println("중");
		this.memberMapper = memberMapper;
	}

	@Override
	public UserDetails loadUserByUsername(String username){
		MemberVO myMember = memberMapper.selectMember(username);
		
		UserDetails userDetails = null;

		try {
			userDetails = User.builder().username(myMember.getUserid()).password(myMember.getUserpw())
					      .authorities(myMember.getAuthorityList().stream().map((auth) -> new SimpleGrantedAuthority(auth.getAuthority()))
						  .collect(Collectors.toList())).build();
			return userDetails;
			
		} catch (UsernameNotFoundException e) {
			return null;
		}
		
	}
	


}
