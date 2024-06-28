package com.spring5legacy.ourpro00;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring5legacy.ourpro00.domain.RecruiterVO;
import com.spring5legacy.ourpro00.mapper.RecruiterMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
public class Test03RecruiterMapperTest {

    private RecruiterMapper recruiterMapper ;
    
    @Autowired
    public void setRecruiterMapper (RecruiterMapper recruiterMapper) {
        this.recruiterMapper = recruiterMapper ;
        System.out.println ("recruiterMapper 주입됨");
    }
    
//  //게시물 목록 조회 테스트 > 테스트 후 메서드 주석처리
//    @Test
//    public void selectRecruitList() {
//    	recruiterMapper.selectRecruitList();
//        System.out.println(recruiterMapper.selectRecruitList()); // 존재하는 게시물 번호로 테스트
//    }
    
  //특정 게시물 조회 테스트(by bno)  테스트 후 메서드 주석처리
    @Test
    public void selectRecruit() {
    	recruiterMapper.selectRecruit(2L);
        System.out.println(recruiterMapper.selectRecruit(2L)); // 존재하는 게시물 번호로 테스트
    }
    
//  //게시물 등록 테스트 - selectKey 사용 안함
//    @Test
//    public void testInsertMyBoardNoKey() {
//        MyBoardVO myBoard = new MyBoardVO();
//        myBoard.setBtitle("메퍼 테스트-입력제목-nokey");
//        myBoard.setBcontent("매퍼 테스트-입력내용-nokey");
//        myBoard.setBwriter("user1");
//        
//        myBoardMapper.insertMyBoardNoKey(myBoard);
//        System.out.println(myBoard);
//    }
    
//  //게시물 등록 테스트 - selectKey 사용
//    @Test
//    public void testInsertMyBoard() {
//    	   MyBoardVO myBoard = new MyBoardVO() ;
//    	   myBoard.setBtitle("매퍼 테스트-입력 제목");
//       	myBoard.setBcontent("매퍼 테스트-입력 내용");
//       	myBoard.setBwriter("user11");
//    	
//       	System.out.println("입력 전: " + myBoard);
//       	myBoardMapper.insertMyBoard(myBoard) ;
//       	System.out.println("입력 후: " + myBoard);
//    }

    
//  //게시물 삭제 요청 테스트 - bdelFlag 컬럼값이 0 -> 1 로 수정만 됨
//    @Test
//    public void testUpdateBdelFlag() {
//        myBoardMapper.updateBdelFlag(10L);
//        System.out.println(myBoardMapper.selectMyBoard(10L));
//    }

//    //게시물 삭제 테스트 - 실제 특정 게시물이 삭제됨
//    @Test
//    public void testDeleteMyBoard() {
//        System.out.println("DELETE COUNT: " + myBoardMapper.deleteMyBoard(9L));
//        System.out.println(myBoardMapper.selectMyBoard(9L));
//    }
    
//  //게시물 수정 테스트
//    @Test
//    public void testUpdateMyBoard() {
//        MyBoardVO myBoard = new MyBoardVO();
//        myBoard.setBno(1L);  //실행 전 존재하는 번호인지 확인할 것
//        myBoard.setBtitle("수정된 제목");
//        myBoard.setBcontent("수정된 내용");
//        
//        System.out.println("UPDATE COUNT: " + myBoardMapper.updateMyBoard(myBoard));
//        myBoard = myBoardMapper.selectMyBoard(1L);
//        System.out.println("수정된 행 값: " + myBoard.toString());
//    }

    
//  //게시물 조회수 증가 테스트: 3번 수행
//    @Test
//    public void testUpdateBviewsCnt() {
//        myBoardMapper.updateBviewsCnt(1L);
//        System.out.println("수정된 행 값: " + myBoardMapper.selectMyBoard(1L).toString());
//    }






}
