package com.spring5legacy.ourpro00;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring5legacy.ourpro00.mapper.JobSeekerMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
public class Test03JobSeekerMapperTest {

    @SuppressWarnings("unused")
	private JobSeekerMapper jobSeekerMapper ;
    
    @Autowired
    public void setRecruiterMapper (JobSeekerMapper jobSeekerMapper) {
        this.jobSeekerMapper  = jobSeekerMapper  ;
        System.out.println ("jobSeekerMapper 주입됨");
    }
    
//  //게시물 목록 조회 테스트 
//    @Test
//    public void selectJobSeekerList() {
//    	jobSeekerMapper.selectJobSeekerList();
//        System.out.println(jobSeekerMapper.selectJobSeekerList()); 
//    }
    
//  //특정 게시물 조회 테스트(by bno) 
//    @Test
//    public void selectJobSeeker() {
//    	jobSeekerMapper.selectJobSeeker(2L);
//        System.out.println(jobSeekerMapper.selectJobSeeker(2L)); 
//    }
    
// // 구직글 총 수
//    @Test
//    public void selectRowTotal() {
//    	jobSeekerMapper.selectRowTotal();
//    	System.out.println(jobSeekerMapper.selectRowTotal());
//    }
    
//  //게시물 등록 테스트 - selectKey 사용 안함
//    @Test
//    public void insertJobSeeker() {
//    	JobSeekerVO jobSeeker = new JobSeekerVO();
//    	jobSeeker.setAtitle("매퍼 테스트-구직 제목");
//    	jobSeeker.setAcontent("매퍼 테스트-구직제목");
//    	jobSeeker.setAwriter("작성자2");
//    	jobSeeker.setBno(2L);
//    	
//    	jobSeekerMapper.insertJobSeeker(jobSeeker);
//    	System.out.println(jobSeeker);
//    }
    

 
  //게시물 등록 테스트 - selectKey 사용
//    @Test
//    public void testInsertjobSeeker() {
//    	JobSeekerVO jobSeeker = new JobSeekerVO();
//    	jobSeeker.setAtitle("테스트 제목1");
//       	jobSeeker.setAcontent("테스트 내용1");
//       	jobSeeker.setAwriter("작성자2");
//    	
//       	System.out.println("입력 전: " + jobSeeker);
//       	jobSeekerMapper.insertJobSeeker(jobSeeker);
//       	System.out.println("입력 후: " + jobSeeker);
//    }

    


//    //게시물 삭제 테스트 - 실제 특정 게시물이 삭제됨
//    @Test
//    public void testdeleteJobSeeker() {
//        System.out.println("DELETE COUNT: " + jobSeekerMapper.deleteJobSeeker(22L));
//        System.out.println(jobSeekerMapper.deleteJobSeeker(22L));
//    }
    
    // 특정 구직글 수정 테스트1
//  @Test
//	public void updateJobSeeker() {
//		JobSeekerVO jobSeeker = new JobSeekerVO();
//		System.out.println("입력 전: " + jobSeeker);
//		jobSeeker.setAno(2L);
//		jobSeeker.setAtitle("변경 제목");
//  	jobSeeker.setAcontent("변경내용");
//	
//  	
//  	jobSeekerMapper.updateJobSeeker(jobSeeker) ;
//  	System.out.println("입력 후: " + jobSeeker);
//	}

//    // 특정 구직글 수정 테스트2
//	@Test
//	public void testupdateJobSeeker2() {
//		jobSeekerMapper.updateJobSeeker(1L,"매퍼 테스트-수정2 제목", "매퍼 테스트-수정2 내용") ;
//		System.out.println(jobSeekerMapper.selectJobSeeker(1L));
//	}






}
