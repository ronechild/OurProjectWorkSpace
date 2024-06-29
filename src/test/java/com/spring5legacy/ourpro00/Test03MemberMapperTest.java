package com.spring5legacy.ourpro00;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5legacy.ourpro00.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({	"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
                        	 "file:src/main/webapp/WEB-INF/spring/security-context.xml",
                          "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
//@Log4j
@SuppressWarnings("unused")
public class Test03MemberMapperTest {
    //사용자 암호의 암호화 빈 주입
	private PasswordEncoder pwencoder;
    private MemberMapper memberMapper;

    @Autowired
    public void setPwencoder (PasswordEncoder pwencoder) {
        this.pwencoder = pwencoder;
    }

    //매퍼인터페이스 주입
    
    @Autowired
    public void setMyMemberMapper (MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

//    //테스트 메서드 1: 회원 등록 테스트
//    @Test
//    public void testInsertMember() {
//    	
//        MemberVO myMember = new MemberVO();
//        
//        for(int i = 2; i <= 10; i++) {
//
//                myMember.setUserid("user" + i);
//                myMember.setUserpw(pwencoder.encode("pw" + i));
//                myMember.setUsername("일반사용자" + i);
//                myMember.setEmail("email" + i);
//                myMember.setPhone("phone" + i);
//                
//            log.info(myMember);            
//            memberMapper.insertMember(myMember);
//        } //for-End
//    }
    
    //테스트 메서드 2: 회원 권한 등록 테스트
//    @Test
//    public void testInsertMyMemAuthority() {
//        AuthorityVO authority = new AuthorityVO();
//        
//        for(int i = 2; i <= 10; i++) {
//        	if (i<5) {
//        		authority.setUserid("user" + i);
//        		authority.setAuthority("USER");
//			} else if (i<8){
//				authority.setUserid("user" + i);
//				authority.setAuthority("COMPANY");
//			} else {
//				authority.setUserid("user" + i);
//				authority.setAuthority("ADMIN");
//			}
//                
//            log.info(authority);
//            memberMapper.insertMemberAuthority(authority);
//            
//        } //for-End
//    }
    
    //테스트 메서드 3: 회원 정보 조회 테스트 
//    @Test
//    public void testRead() {
//        MemberVO myMember = memberMapper.selectMember("user2");
//        log.info(myMember);
//        
//        myMember.getAuthorityList().forEach(authorityVO -> log.info(authorityVO));
//    }
}
