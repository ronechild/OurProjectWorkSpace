package com.spring5legacy.ourpro00;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration    //테스트 시, DispatcherServlet의 servlet-context.xml 설정 구성파일(들)을 사용하기 위한 어노테이션
@ContextConfiguration({	"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
                        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class Test05MyBoardControllerTest {

    //테스트 환경 구성 시작, 
    //컨트롤러 테스트를 위해서는 WebApplicationContext 를 객체로 주입 받아야 합니다.
    private WebApplicationContext ctx;
    
    @Autowired
    public void setCtx (WebApplicationContext ctx) {
    	this.ctx = ctx ;
    }
    
    private MockMvc mockMvc ;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    } //테스트 환경 구성-끝


//    //게시물 목록 조회 테스트
//    @Test
//    public void showJobSeekerList() throws Exception {
//        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
//        		                )
//                        .andReturn()
//                        .getModelAndView()
//                        //.getViewName()) ;
//                        .getModelMap());
//    }
    

//    //게시물 등록-페이지 호출 테스트
//    @Test
//    public void testShowBoardRegisterPage() throws Exception {
//        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/register"))
//                        .andReturn()
//                        .getModelAndView()
//                        .getViewName());
//                        //.getModelMap());
//    }

//    //게시물 등록 처리 테스트
//    @Test
//    public void testRegisterJobSeeker() throws Exception {
//        String resultPage =
//                mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//                                                      .param("atitle", "게시물 등록 -컨트롤러 테스트 제목")
//                                                      .param("acontent", "게시물 등록 -컨트롤러 테스트 내용")
//                                                      .param("awriter", "작성자2")
//                                                      .param("bno","2"))
//                        .andReturn().getModelAndView().getViewName();
//        log.info(resultPage);
//    }

//    //게시물 조회-수정 페이지 호출 테스트
//    @Test
//    public void testShowJobSeekerModify() throws Exception {
//        log.info(mockMvc.perform(MockMvcRequestBuilders
//                               .get("/board/detail") 
//                               .param("ano", "3")
//                               )
//                        .andReturn()
//                        .getModelAndView()
//                        .getModelMap());
//    }

    //게시물 수정 처리
//    @Test
//    public void testModifyBoard() throws Exception {
//        String resultPage = mockMvc.perform(MockMvcRequestBuilders
//                                              .post("/board/modify")
//                                              .param("ano", "1")
//                                              .param("atitle", "게시물 수정-컨트롤러 테스트 제목3333")   //2222추가 테스트
//                                              .param("acontent", "게시물 수정-컨트롤러 테스트 내용3333")
//                                              .param("awriter", "test"))
//                                      .andReturn()
//                                      .getModelAndView()
//                                      .getViewName();
//        log.info(resultPage);
//    }



    //특정 게시물 삭제 테스트 - 실제 삭제
    @Test
    public void testRemoveBoard() throws Exception {
        //삭제전 데이터베이스에 게시물 번호 확인할 것
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
                                                                  .param("ano", "24"))
                                  .andReturn()
                                  .getModelAndView()
                                  .getViewName();
        log.info(resultPage);
    }

    
}

