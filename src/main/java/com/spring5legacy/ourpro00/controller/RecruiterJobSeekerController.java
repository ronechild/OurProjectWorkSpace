package com.spring5legacy.ourpro00.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring5legacy.ourpro00.common.paging.PagingCreatorDTO;
import com.spring5legacy.ourpro00.common.paging.PagingDTO;
import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.service.JobSeekerService;
import com.spring5legacy.ourpro00.service.RecruiterService;

@Controller
@RequestMapping(value = { "/board/*" })
public class RecruiterJobSeekerController {

	private JobSeekerService jobSeekerService;
	private RecruiterService recruiterService;

	// 생성자를 이용한 의존성 주입 :
	@Autowired
	public RecruiterJobSeekerController(RecruiterService recruiterService, JobSeekerService jobSeekerService) {
		this.recruiterService = recruiterService;
		this.jobSeekerService = jobSeekerService;
	}

	// 홈페이지
	@GetMapping("/homepage")
	@PreAuthorize("permitAll")
	public void showRecruitList(Model model, @ModelAttribute("pagingCreator") PagingDTO paging) {
		PagingCreatorDTO pagingCreator = recruiterService.selectRecruitList(paging);
		model.addAttribute("pagingCreator", pagingCreator);
		System.out.println("컨트롤러:::구인글 목록 조회" + pagingCreator);
	}

	// 홈페이지
	@PostMapping("/homepage")
	@PreAuthorize("permitAll")
	public void showRecruitList2(Model model, @ModelAttribute("pagingCreator") PagingDTO paging) {
		PagingCreatorDTO pagingCreator = recruiterService.selectRecruitList(paging);
		model.addAttribute("pagingCreator", pagingCreator);
		System.out.println("컨트롤러:::구인글 목록 조회" + pagingCreator);
	}

	// 구인글 작성 페이지 (구인자)
	@GetMapping("/register")
	@PreAuthorize("hasAnyAuthority('COMPANY','ADMIN')")
	public void showRegisterRecruit() {
		System.out.println("컨트롤러:::구인글 작성 페이지 호출");
	}

	// 구인글 등록 (구인자)
	@PostMapping("/register")
	@PreAuthorize("hasAnyAuthority('COMPANY','ADMIN')")
	public String registerRecruit(Model model, RecruiterVO recruiterVO, RedirectAttributes redirectAttr) {
		recruiterService.insertRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::구인글 등록 완료 후" + bno + "번 구인글 호출");
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		redirectAttr.addFlashAttribute("result", bno);
		return "redirect:/board/detail?bno=" + bno;
	}

	// 구인글 상세 페이지
	@GetMapping("/detail")
	@PreAuthorize("permitAll")
	public String showRecruit(Model model, Long bno) {
		System.out.println(bno);
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		model.addAttribute("jsList", jobSeekerService.getJobSeekerListForDetail(bno));
		System.out.println("컨트롤러:::" + bno + "번 구인글 호출" + recruiterService.selectRecruit(bno));
		return "/board/detail";
	}

	// 구인글 수정 페이지 (구인자)
	@GetMapping("/modify")
	@PreAuthorize("hasAnyAuthority('COMPANY','ADMIN')")
	public void showModifyRecruit(Model model, Long bno) {
		System.out.println("컨트롤러:::bno : " + bno);
		System.out.println("컨트롤러:::recruiterVO : " + recruiterService.selectRecruit(bno));
		model.addAttribute("recruiterVO", recruiterService.selectRecruit(bno));


		System.out.println("컨트롤러:::" + bno + "번 구인글 수정 페이지 호출");
	}

	// 구인글 수정 (구인자)
	@PostMapping("/modify")
	@PreAuthorize("hasAnyAuthority('COMPANY','ADMIN')")
	public String modifyRecruit(RecruiterVO recruiterVO) {
		recruiterService.updateRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::" + bno + "번 구인글 수정 완료 후" + bno + "번 구인글 호출");
		return "redirect:/board/detail?bno=" + bno;
	}

	// 이력서 작성 페이지 (구직자)
	@GetMapping("/registerA")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public void showJobSeekerRegisterPage(Long bno, Model model) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
	}

	// 이력서 등록
	@PostMapping("/registerA")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public String registerJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr, Model model) {
		System.out.println("controller: 전달된 정보 jobSeeker: " + jobSeeker);
		Long bno = jobSeeker.getBno();
		model.addAttribute("jobSeeker", recruiterService.selectRecruit(bno));

		jobSeekerService.registerJobSeeker(jobSeeker);
		return "redirect:/board/detail?bno=" + bno;
	}

	// 작성한 모든 이력서 조회 페이지 (구직자)
	@GetMapping("/resumelist")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public void showJobSeekerList(Model model, String awriter) {
		model.addAttribute("jobSeeker", jobSeekerService.getJobSeekerList(awriter));
		System.out.println("컨트롤러:jsp에 전달할 model: " + model);
	}

	// 구인글 이력서 조회 페이지
	@GetMapping("/resume")
	@PreAuthorize("hasAnyAuthority('USER', 'COMPANY','ADMIN')")
	public void showJobSeekerDetail(Long ano, Model model, Long bno) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		model.addAttribute("jobSeeker", jobSeekerService.getJobSeeker(ano));
		System.out.println("컨트롤러:::" + ano + "번 이력서 호출");
	}

	// 이력서 수정 페이지 호출
	@GetMapping("/modifyA")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public void showModify(Long ano, Model model, Long bno) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		JobSeekerVO jobSeeker = jobSeekerService.getJobSeeker(ano);
		model.addAttribute("jobSeeker", jobSeeker);
		System.out.println(jobSeeker);
	}

	// 이력서 수정
	@PostMapping("/modifyA")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public String modifyJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {

		String awriter = jobSeeker.getAwriter();

		if (jobSeekerService.modifyJobSeeker(jobSeeker)) {
			redirectAttr.addFlashAttribute("result", "successModify");
		}

		redirectAttr.addFlashAttribute("jobSeeker", awriter);

		return "redirect:/board/homepage";
	}

	// 이력서 삭제
	@PostMapping("/remove")
	@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
	public String removeBoard(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
		if ((jobSeeker = jobSeekerService.deleteJobSeeker(jobSeeker)) != null) {
			System.out.println("controller::service로부터 전달된 jobSeeker: " + jobSeeker);
			redirectAttr.addFlashAttribute("result", "successRemove");
			redirectAttr.addFlashAttribute("deletedAttachFileCnt", String.valueOf(jobSeeker.getDeletedAttachFileCnt()));
		}

		return "redirect:/board/homepage";
	}

	// 구인글 삭제
	@PostMapping("/removeB")
	@PreAuthorize("hasAnyAuthority('COMPANY','ADMIN')")
	public String deleteRecruit(Long bno) {
		recruiterService.deleteRecruit(bno);
		System.out.println("컨트롤러:::" + bno + "번 구인글 삭제 완료 후 homepage로 이동");
		return "redirect:/board/homepage";
	}
}