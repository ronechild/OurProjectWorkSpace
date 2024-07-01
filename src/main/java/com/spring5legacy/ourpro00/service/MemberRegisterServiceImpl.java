package com.spring5legacy.ourpro00.service;

import org.springframework.stereotype.Service;

import com.spring5legacy.ourpro00.domain.AuthorityVO;
import com.spring5legacy.ourpro00.domain.MemberVO;
import com.spring5legacy.ourpro00.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberRegisterServiceImpl implements MemberRegisterService{

	private MemberMapper memberMapper;
	
	@Override
	public void RegisterMember(MemberVO memberVO) {
		
		AuthorityVO authorityVO = new AuthorityVO();
		authorityVO.setUserid(memberVO.getUserid());
		authorityVO.setAuthority("USER");
		
		memberMapper.insertMember(memberVO);
		memberMapper.insertMemberAuth(authorityVO);
	}

}
