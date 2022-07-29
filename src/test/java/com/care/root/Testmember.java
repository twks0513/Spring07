package com.care.root;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import com.care.root.member.controller.MemberController;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:TestMember.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class Testmember {
	@Autowired
	MemberController mc;
	MockMvc mock;
	
	@org.junit.Before
	public void setUp() {
		System.out.println("test 실행 전 ------------");
		mock = MockMvcBuilders.standaloneSetup(mc).build();
	}
	
	@Test
	@Transactional(transactionManager = "txMgr")
	public void testInsert() throws Exception {
		mock.perform(post("/register").param("id", "1234").param("pw", "qwer").param("addr", "옆집"))
		.andDo(print());
		//리다이렉트는 302를 돌려준다. 302면 다른위치로 이동
		
	}
}
