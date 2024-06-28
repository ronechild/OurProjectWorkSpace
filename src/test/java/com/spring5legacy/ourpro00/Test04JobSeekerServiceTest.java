package com.spring5legacy.ourpro00;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5legacy.ourpro00.domain.JobSeekerVO;
import com.spring5legacy.ourpro00.service.JobSeekerService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) //
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class Test04JobSeekerServiceTest {
	
    private JobSeekerService jobSeekerService ;
    
    @Autowired
    public void setJobSeekerService(JobSeekerService jobSeekerService) {
        this.jobSeekerService = jobSeekerService ;
    }
	

//    //MyBoardService 빈 주입 확인 테스트
//    @Test
//    public void testMyBoardServiceExist() {
//
//        System.out.println(jobSeekerService);
//        assertNotNull(jobSeekerService); //MyBoardService 필드가 null 이면, AssertionError 예외 발생
//    }
//
    //게시물 목록 조회 서비스 테스트
    @Test
    public void testgetJobSeeker() {
        jobSeekerService.getJobSeekerList("작성자1").forEach(jobSeeker -> System.out.println(jobSeeker));
    }

//    //게시물 등록(selectKey 이용) 테스트
//    @Test
//    public void registerJobSeeker() {
//        JobSeekerVO jobSeeker = new JobSeekerVO();
//        jobSeeker.setAtitle("서비스 새글 입력  테스트 제목");
//        jobSeeker.setAcontent("서비스 새글 입력 테스트  내용");
//        jobSeeker.setAwriter("작성자1");
//        jobSeeker.setBno(2L);
//
//        jobSeekerService.registerJobSeeker(jobSeeker);
//        System.out.println("등록된 게시물의 Ano: " + jobSeeker.getAno());
//    }
    

//    //게시물 수정 테스트
//    @Test
//    public void testmodifyJobSeeker() {
//        JobSeekerVO jobSeeker = jobSeekerService.getJobSeeker(2L);
//        
//        if (jobSeeker == null) {
//    	    return;
//        }
//        
//        jobSeeker.setAtitle("제목 수정:서비스 테스트");
//        System.out.println("수정된 게시물 조회 결과(boolean): " + jobSeekerService.modifyJobSeeker(jobSeeker));
//    }
//
//    //게시물 수정 테스트
//    @Test
//    public void testModifyBoard() {
//        System.out.println("수정된 게시물 조회 결과(boolean): " 
//                          + jobSeekerService.modifyJobSeeker(2L, 
//                                                       "제목 수정:서비스 테스트2",
//                                                       "내용 수정:서비스 테스트2"));
//    }
    

//    //특정 게시물 삭제  테스트 - 실제 삭제
//    @Test
//    public void testdeleteJobSeeker() {
//        // 게시물 번호의 존재 여부를 확인하고 테스트할 것
//    	System.out.println("삭제 전: " + jobSeekerService.getJobSeeker(2L));
//        System.out.println("서비스: 특정 게시물 삭제 테스트: " + jobSeekerService.deleteJobSeeker(2L));
//        System.out.println("삭제 후: " + jobSeekerService.getJobSeeker(2L));
//    }

}
