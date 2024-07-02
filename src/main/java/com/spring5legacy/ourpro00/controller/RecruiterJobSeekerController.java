package com.spring5legacy.ourpro00.controller;

<<<<<<< Updated upstream
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
>>>>>>> Stashed changes
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< Updated upstream

@Controller
@RequestMapping(value = {"/board"})
public class RecruiterJobSeekerController {
	
}
=======
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
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showRegisterRecruit(Model model, RecruiterVO recruiterVO, Long bno) {
		model.addAttribute("recruiterVO", recruiterService.selectRecruit(2L));
		System.out.println("컨트롤러:::구인글 작성 페이지 호출");
	}

	// 구인글 등록 (구인자)
	@PostMapping("/register")
	@PreAuthorize("hasAuthority('COMPANY')")
	public String registerRecruit(RecruiterVO recruiterVO, RedirectAttributes redirectAttr) {
		recruiterService.insertRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::구인글 등록 완료 후" + bno + "번 구인글 호출");
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
	@PreAuthorize("hasAuthority('COMPANY')")
	public void showModifyRecruit(Model model, Long bno) {
		model.addAttribute("recruiterVO", recruiterService.selectRecruit(bno));

		System.out.println("컨트롤러:::recruiterVO : " + recruiterService.selectRecruit(bno));

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
	@GetMapping("/registerA")
	@PreAuthorize("hasAuthority('USER')")
	public void showJobSeekerRegisterPage(Long bno, Model model) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
	}

	// 이력서 등록
	@PostMapping("/registerA")
	@PreAuthorize("hasAuthority('USER')")
	public String registerJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr, Model model) {
		System.out.println("controller: 전달된 정보 jobSeeker: " + jobSeeker);
		Long bno = jobSeeker.getBno();
		model.addAttribute("jobSeeker", recruiterService.selectRecruit(bno));

		jobSeekerService.registerJobSeeker(jobSeeker);

		return "redirect:/board/detail?bno=" + bno;
	}

	// 작성한 모든 이력서 조회 페이지 (구직자)
	@GetMapping("/resumelist")
	@PreAuthorize("hasAuthority('USER')")
	public void showJobSeekerList(Model model, String awriter) {
		model.addAttribute("jobSeeker", jobSeekerService.getJobSeekerList(awriter));
		System.out.println("컨트롤러:jsp에 전달할 model: " + model);
	}

	// 구인글 이력서 조회 페이지
	@GetMapping("/resume")
	@PreAuthorize("hasAuthority('USER', 'COMPANY')")
	public void showJobSeekerDetail(Long ano, Model model, Long bno) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		model.addAttribute("jobSeeker", jobSeekerService.getJobSeeker(ano));
		System.out.println("컨트롤러:::" + ano + "번 이력서 호출");
	}

	// 이력서 수정 페이지 호출
	@GetMapping("/modifyA")
	@PreAuthorize("hasAuthority('USER')")
	public void showModify(Long ano, Model model, Long bno) {
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		JobSeekerVO jobSeeker = jobSeekerService.getJobSeeker(ano);
		model.addAttribute("jobSeeker", jobSeeker);
		System.out.println(jobSeeker);
	}

	// 이력서 수정
	@PostMapping("/modifyA")
	@PreAuthorize("hasAuthority('USER')")
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
	@PreAuthorize("hasAuthority('USER')")
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
	@PreAuthorize("hasAuthority('COMPANY')")
	public String deleteRecruit(Long bno) {
		recruiterService.deleteRecruit(bno);
		System.out.println("컨트롤러:::" + bno + "번 구인글 삭제 완료 후 homepage로 이동");
		return "redirect:/board/homepage";
	}
}
>>>>>>> Stashed changes
