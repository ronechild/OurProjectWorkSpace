//package com.spring5legacy.ourpro00.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.spring5legacy.ourpro00.domain.JobSeekerVO;
//import com.spring5legacy.ourpro00.service.JobSeekerService;
//
//@Controller
//@RequestMapping(value = {"/board/*"})
//public class RecruiterJobSeekerController_JobSeeker {
//
//		private JobSeekerService jobSeekerService ;
//		
//		
//		//@Autowired
//		public RecruiterJobSeekerController_JobSeeker(JobSeekerService jobSeekerService) {
//			this.jobSeekerService = jobSeekerService;
//		}
//		
//		// 작성한 모든 이력서 조회 페이지 (구직자)
//		@GetMapping("/list")
//		public void showJobSeekerList(Model model, String awriter) {
//			model.addAttribute("jsList", jobSeekerService.getJobSeekerList(awriter)) ;
//			System.out.println("컨트롤러:jsp에 전달할 model: " + model);
//		}
//		
//		//이력서 등록 페이지 호출
//	    @GetMapping("/register")
//	    //@PreAuthorize("isAuthenticated()")
//	    public void showJobSeekerRegisterPage() {
//	    	
//	    }
//	    
//	    //이력서 등록
//	    @PostMapping("/register")
//	    //@PreAuthorize("isAuthenticated()")
//	    public String registerJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
//	    	System.out.println("controller: 전달된 정보 jobSeeker: " + jobSeeker);
//	    	Long ano = jobSeekerService.registerJobSeeker(jobSeeker) ;
//	    	
//	    	//redirectAttr.addAttribute("result", ano) ;
//	    	redirectAttr.addFlashAttribute("result", ano) ;
//	    	
//	    	return "redirect:/myboard/list" ;
//	    }
//	    
//		
//		
//		
//		
//	  //이력서 상세
//	    @GetMapping("/detail")
//	    public void showJobSeekerDetail(Long ano, Model model) {
//	    	
//	    	model.addAttribute("jobSeeker", jobSeekerService.getJobSeeker(ano)) ;
//	    	
//	        System.out.println("컨트롤러: model: " + model);
//	    }
//	  
//	    
//	    
//	    
//	    //이력서 수정 페이지 호출
//	    @GetMapping("/modify")
//	    public void showModify(Long ano, Model model) {
//	    	JobSeekerVO jobSeeker = jobSeekerService.getJobSeeker(ano) ;
//	    	model.addAttribute("jobSeeker", jobSeeker) ;
//	    }
//	    
//	    //이력서 수정
//	    @PostMapping("/modify")
//	    public String modifyJobSeeker(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
//
//	    	if(jobSeekerService.modifyJobSeeker(jobSeeker)) {
//	    		redirectAttr.addFlashAttribute("result", "successModify") ;
//	    		
//	    	} 
//	    	
//	    	redirectAttr.addAttribute("ano", jobSeeker.getAno()) ;
//	    	
//	    	//return "redirect:/myboard/detail" + myBoardPaging.addPagingParamsToURI();
//	    	return "redirect:/myboard/detail";
//	    }
//	    
//	    //이력서 삭제
//	    @PostMapping("/remove")
//	    public String removeBoard(JobSeekerVO jobSeeker, RedirectAttributes redirectAttr) {
//	    	if ((jobSeeker = jobSeekerService.deleteJobSeeker(jobSeeker)) != null) {
//	    		System.out.println("controller::service로부터 전달된 jobSeeker: " + jobSeeker);
//	    		redirectAttr.addFlashAttribute("result", "successRemove") ;
//	            redirectAttr.addFlashAttribute("deletedAttachFileCnt", String.valueOf(jobSeeker.getDeletedAttachFileCnt())  ) ;
//	    	}
//	    	
//	    	return "redirect:/myboard/list" ;
//	    }
//	    
//}
