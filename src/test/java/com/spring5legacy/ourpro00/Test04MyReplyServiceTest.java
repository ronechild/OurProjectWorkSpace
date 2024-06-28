package com.spring5legacy.ourpro00;

import org.junit.Test;
//import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5legacy.ourpro00.controller.CommentController;
import com.spring5legacy.ourpro00.service.CommentService;

@WebAppConfiguration    //테스트 시, DispatcherServlet의 servlet-context.xml 설정 구성파일(들)을 사용하기 위한 어노테이션
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({   "file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
											  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class Test04MyReplyServiceTest {

    
    private CommentService commentService;
    private CommentController commentController ;

    @Autowired
	public void setMyReplyService(CommentService commentService) {
		this.commentService = commentService;
	}
    
      
//  //CommentService 빈 생성 유무 확인 테스트, 테스트 후, 메서드만 주석 처리
//    @Test  
//    public void testMyReplyServiceExist() {
//    	System.out.println("Dd");
//
//        assertNotNull(commentService);
//    }
//
    //특정 게시물의 댓글 목록 조회 테스트 
//    @Test
//    public void testselectCommentList() {
//    	
//        List<CommentVO> commentVO = commentService.selectCommentList(1L);
//        System.out.println("댓글 목록 조회 : "  + commentVO);
//
//    }
    
    
    //게시물에 대한 댓글 등록 테스트
//    @Test
//    public void testinsertComment() {
//
//        CommentVO commentVO = new CommentVO();
//        commentVO.setBno(1L);
//        commentVO.setRcontent("조건희가 왔다777");
//        commentVO.setRwriter("작성자1");
//        commentService.insertComment(commentVO);
//        
//        System.out.println("등록된 댓글  : " + commentVO);
//        
//    }
    //게시물에 대한 특정 댓글 수정 테스트
//    @Test
//    public void testUpdateReply() {
//
//        List<CommentVO> comment = commentService.selectCommentList(2L) ;
//       
//    }
//    
//    //게시물에 대한 특정 댓글 삭제
//    @Test
//    public void testdeleteComment() {
////        log.info("서비스: 특정 게시물 삭제 테스트: " + myReplyService.removeReply(229376L, 42L));
//    	commentService.deleteComment(1L, 44L);
//    }

//
//    
}
