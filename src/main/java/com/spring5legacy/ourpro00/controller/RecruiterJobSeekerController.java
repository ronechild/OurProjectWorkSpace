package com.spring5legacy.ourpro00.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.service.RecruiterService;

@Controller
@RequestMapping(value = {"/board/*"})
public class RecruiterJobSeekerController {
	
	private RecruiterService recruiterService;
	
	// 생성자를 이용한 의존성 주입 : 
	public RecruiterJobSeekerController(RecruiterService recruiterService) {
		this.recruiterService = recruiterService;
	}
	
	// 홈페이지
	@GetMapping("/homepage")
	@PreAuthorize("permitAll")
	public void showRecruitList(Model model, RecruiterVO recruiterVO) {
		model.addAttribute("recruiterVO", recruiterService.selectRecruitList(recruiterVO));
		System.out.println("컨트롤러:::구인글 목록 조회");
	}
	
	// 구인글 작성 페이지 (구인자)
	@GetMapping("/register")
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showRegisterRecruit() {
		System.out.println("컨트롤러:::구인글 작성 페이지 호출");
	}
	
	// 구인글 등록 (구인자)
	@PostMapping("/register")
	@PreAuthorize("hasAuthority('COMPANY')")
	public String registerRecruit(RecruiterVO recruiterVO) {
		recruiterService.insertRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::구인글 등록 완료 후" + bno + "번 구인글 호출");
		return "redirect:/board/detail?bno=" + bno;
	}
	
	// 구인글 상세 페이지
	@GetMapping("/detail")
	@PreAuthorize("permitAll")
	public void showRecruit(Model model, Long bno, RecruiterVO recruiterVO) {
		model.addAttribute("recruiterVO", recruiterVO);
		recruiterService.selectRecruit(bno);
		System.out.println("컨트롤러:::" + bno + "번 구인글 호출");
	}
	
	// 구인글 수정 페이지 (구인자)
	@GetMapping("/modify")
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showModifyRecruit(Model model, Long bno, RecruiterVO recruiterVO) {
		model.addAttribute("recruiterVO", recruiterVO);
		recruiterService.selectRecruit(bno);
		System.out.println("컨트롤러:::" + bno + "번 구인글 수정 페이지 호출");
	}
	
	// 구인글 수정 (구인자)
	@PostMapping("/modify")
	@PreAuthorize("hasAuthority('COMPANY')")
	public String modifyRecruit(RecruiterVO recruiterVO) {
		recruiterService.updateRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::" + bno + "번 구인글 수정 완료 후" + bno + "번 구인글 호출");
		return "redirect:/board/detail?bno=" + bno;
	}
	
	
	// 이력서 작성 페이지 (구직자)
	
	
	// 작성한 모든 이력서 조회 페이지 (구직자)
	
	
	// 구인글 이력서 조회 페이지
	@GetMapping("/recruitDetail")
	@PreAuthorize("hasAuthority('USER', 'COMPANY')")
	public String showJobSeekerRecruit(Model model, Long cno, RecruiterVO recruiterVO) { // bno? ano?
		model.addAttribute("recruiterVO", recruiterVO);
		//구직자Service.이력서호출(bno);
		System.out.println("컨트롤러:::" + cno + "번 이력서 호출");
		return "redirect:/board/detail?bno=" + cno;
	}
	
//	// 이력서 수정 페이지 (구직자)
	
	
	// 회원가입 페이지
	
	
}