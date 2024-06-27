package com.spring5legacy.ourpro00.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring5legacy.ourpro00.domain.MemberVO;
import com.spring5legacy.ourpro00.mapper.MemberMapper;

public class MemberDetailsService  implements UserDetailsService{
	
	private MemberMapper memberMapper;
	
	@Autowired
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberVO member = memberMapper.selectMember(username);
		
		return member == null ? null : new MemberUser(member);
	}
	


}
