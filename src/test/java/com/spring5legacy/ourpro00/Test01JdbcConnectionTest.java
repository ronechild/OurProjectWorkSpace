package com.spring5legacy.ourpro00;

import javax.sql.DataSource;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
//@Log4j
public class Test01JdbcConnectionTest {

	@SuppressWarnings("unused")
	private DataSource dataSource;

    @Autowired
    public void setDataSource (DataSource dataSource) {
    	this.dataSource = dataSource ;
    }

//    @Test
//    public void testConnection() {
//    
//        try (Connection con = dataSource.getConnection()){
//            log.info(con);
//        
//        } catch(Exception e) {
//            fail(e.getMessage());
//        }
//    }

}
