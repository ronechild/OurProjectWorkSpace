package com.spring5legacy.ourpro00.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring5legacy.ourpro00.domain.RecruiterVO;

@Controller
@RequestMapping(value = {"/board/*"})
public class RecruiterJobSeekerController {
	
	// 홈페이지
	@GetMapping("/homepage")
	@PreAuthorize("permitAll")
	public void showRecruitList(Model model, RecruiterVO recruiterVO) {
		model.addAttribute(recruiterVO);
		System.out.println("컨트롤러:::구인글 목록 조회");
	}
	
	// 구인글 작성 페이지 (구인자)
	@GetMapping("/register")
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showRegisterRecruit() {
	}
	
	// 구인글 등록 (구인자)
	@PostMapping("/register")
	@PreAuthorize("hasAuthority('COMPANY')")
	public String registerRecruit() {
		return "redirect:/board/homepage";
	}
	
	
	// 구인글 상세 페이지
	@GetMapping("/detail")
	@PreAuthorize("permitAll")
	public void showRecruit(Model model, Long bno) {
	}
	
	// 구인글 수정 페이지 (구인자)
	@GetMapping("/modify")
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showModifyRecruit(Model model, Long bno, RecruiterVO recruitVO) {
		
	}
	
	
	// 구인글 수정 (구인자)
	@PostMapping("/modify")
	@PreAuthorize("hasAuthority('COMPANY')")
	public String modifyRecruit() {
		return "redirect:/board/detail";
	}
	
	
	// 이력서 작성 페이지 (구직자)
	
	
	// 작성한 모든 이력서 조회 페이지 (구직자)
	
	
	// 구인글 이력서 조회 페이지
	
	
//	// 이력서 수정 페이지 (구직자)
	
	
	// 회원가입 페이지
	
	
}