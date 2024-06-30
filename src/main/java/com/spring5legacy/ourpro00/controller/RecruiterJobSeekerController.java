package com.spring5legacy.ourpro00.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.service.JobSeekerService;
import com.spring5legacy.ourpro00.service.RecruiterService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = {"/board/*"})
@AllArgsConstructor
public class RecruiterJobSeekerController {

	private JobSeekerService jobSeekerService ;
	private RecruiterService recruiterService;
	
	// 생성자를 이용한 의존성 주입 : 
	@Autowired
	public RecruiterJobSeekerController(RecruiterService recruiterService, JobSeekerService jobSeekerService) {
		this.recruiterService = recruiterService;
		this.jobSeekerService = jobSeekerService;
	}
	
	// 홈페이지
	@PostMapping("/homepage")
	@PreAuthorize("permitAll")
	public void showRecruitList(Model model,@ModelAttribute("recruiter") RecruiterVO  recruiter) {
		List<RecruiterVO> recruiterList = recruiterService.selectRecruitList(recruiter);
		model.addAttribute("recruitList", recruiterList );
		System.out.println("컨트롤러:::구인글 목록 조회" + recruiterList);
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
	public String registerRecruit(RecruiterVO recruiterVO, RedirectAttributes redirectAttr) {
		recruiterService.insertRecruit(recruiterVO);
		Long bno = recruiterVO.getBno();
		System.out.println("컨트롤러:::구인글 등록 완료 후" + bno + "번 구인글 호출");
    	redirectAttr.addFlashAttribute("result", bno) ;
		return "redirect:/board/detail?bno=" + bno;
	}
	
	// 구인글 상세 페이지
//	@GetMapping("/detail")
//	@PreAuthorize("permitAll")
//	public void showRecruit(Model model, Long bno, RecruiterVO recruiterVO) {
//		model.addAttribute("recruiterVO", recruiterVO);
//		recruiterService.selectRecruit(bno);
//		System.out.println("컨트롤러:::" + bno + "번 구인글 호출");
//	}
	@GetMapping("/detail")
//	@PreAuthorize("permitAll")
	public String showRecruit(Model model, Long bno) {
		System.out.println(bno);
		model.addAttribute("recruit", recruiterService.selectRecruit(bno));
		model.addAttribute("jsList", jobSeekerService.getJobSeekerListForDetail(bno)) ;
		System.out.println("컨트롤러:::" + bno + "번 구인글 호출" +recruiterService.selectRecruit(bno));
		
		System.out.println("7번 bno의 데이터 : " + recruiterService.selectRecruit(7L));
		
		return "/board/detail";
	}
	
	// 구인글 수정 페이지 (구인자)
//	@GetMapping("/modify")
//	@PreAuthorize("hasAuthority('COMPANY')")
//	public void showModifyRecruit(Model model, Long bno, RecruiterVO recruiterVO) {
//		model.addAttribute("recruiterVO", recruiterVO);
//		recruiterService.selectRecruit(bno);
//		System.out.println("컨트롤러:::" + bno + "번 구인글 수정 페이지 호출");
//	}
	@GetMapping("/modify")
//	@PreAuthorize("hasAuthority('COMPANY')")
	public void showModifyRecruit(Model model, Long bno) {
		model.addAttribute("recruiterVO", recruiterService.selectRecruit(bno));
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
    public void showJobSeekerRegisterPage() {
    }
	
    //이력서 등록
    @PostMapping("/registerA")
    //@PreAuthorize("isAuthenticated()")
    public String registerJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
    	System.out.println("controller: 전달된 정보 jobSeeker: " + jobSeeker);
    	Long ano = jobSeekerService.registerJobSeeker(jobSeeker) ;
    	
    	//redirectAttr.addAttribute("result", ano) ;
    	redirectAttr.addFlashAttribute("result", ano) ;
    	
    	return "redirect:/myboard/list" ;
    }
	
	
	
    // 작성한 모든 이력서 조회 페이지 (구직자)
    @GetMapping("/resumelist")
    public void showJobSeekerList(Model model, String awriter) {
       model.addAttribute("jsList", jobSeekerService.getJobSeekerList(awriter)) ;
       System.out.println("컨트롤러:jsp에 전달할 model: " + model);
    }

	
    // 구인글 이력서 조회 페이지
    @GetMapping("/resume")
    @PreAuthorize("hasAuthority('USER', 'COMPANY')")
    public void showJobSeekerDetail(Long ano, Model model ) {
        
        model.addAttribute("jobSeeker", jobSeekerService.getJobSeeker(ano)) ;
 /* //      model.addAttribute("test", recruiterService.selectRecruit(btitle)) ;
 */      //구직자Service.이력서호출(bno);
       System.out.println("컨트롤러:::" + ano + "번 이력서 호출");
    }
	
    //이력서 수정 페이지 호출
    @GetMapping("/modifyA")
    public void showModify(Long ano, Model model) {
    	JobSeekerVO jobSeeker = jobSeekerService.getJobSeeker(ano) ;
    	model.addAttribute("jobSeeker", jobSeeker) ;
    }
	
    //이력서 수정
    @PostMapping("/modifyA")
    public String modifyJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {

    	if(jobSeekerService.modifyJobSeeker(jobSeeker)) {
    		redirectAttr.addFlashAttribute("result", "successModify") ;
    		
    	} 
    	
    	redirectAttr.addAttribute("ano", jobSeeker.getAno()) ;
    	
    	//return "redirect:/myboard/detail" + myBoardPaging.addPagingParamsToURI();
    	return "redirect:/myboard/detail";
    }
    
  //이력서 삭제
    @PostMapping("/remove")
    public String removeBoard(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
    	if ((jobSeeker = jobSeekerService.deleteJobSeeker(jobSeeker)) != null) {
    		System.out.println("controller::service로부터 전달된 jobSeeker: " + jobSeeker);
    		redirectAttr.addFlashAttribute("result", "successRemove") ;
            redirectAttr.addFlashAttribute("deletedAttachFileCnt", String.valueOf(jobSeeker.getDeletedAttachFileCnt())  ) ;
    	}
    	
    	return "redirect:/myboard/list" ;
    }
    
    
    
	// 회원가입 페이지
	
	
}