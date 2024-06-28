package com.spring5legacy.ourpro00.mapper;

import com.spring5legacy.ourpro00.domain.AuthorityVO;
import com.spring5legacy.ourpro00.domain.MemberVO;

public interface MemberMapper {

	// 유저 정보
	public MemberVO selectMember(String userid);
	
	// 회원 가입
	public void insertMember(MemberVO myMember);
	
	// 회원 권한 부여
	public void insertMemberAuthority();
	
	// 회원 탈퇴
	public void updateMdropFlag();

	public void insertMemberAuth(AuthorityVO myAuthority);
}
