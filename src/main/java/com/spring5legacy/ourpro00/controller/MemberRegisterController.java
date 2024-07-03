package com.spring5legacy.ourpro00.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring5legacy.ourpro00.domain.MemberVO;
import com.spring5legacy.ourpro00.service.MemberRegisterService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberRegisterController {

	private MemberRegisterService memberRegisterService;
	private PasswordEncoder passwordEncoder;

	@PostMapping("/memberRegister")
	@Transactional
	public String MemberRegister(MemberVO memberVO) {
		memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
		System.out.println(memberVO);
		memberRegisterService.RegisterMember(memberVO);

		return "/common/signup";
	}
}
