package com.spring5legacy.ourpro00.mapper;

public interface MemberMapper {

	// 유저 정보
	public void selectMember();
	
	// 회원 가입
	public void insertMember();
	
	// 회원 권한 부여
	public void insertMemberAuthority();
}
