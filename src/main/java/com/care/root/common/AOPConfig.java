package com.care.root.common;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@Component
@Aspect //AOP등록필수 어노테이션
@EnableAspectJAutoProxy
public class AOPConfig {
	@Around("execution(* com.care.root.board.service.BoardServiceImpl.boardAllList(..))") //실행전,후 2번 실행
	public void commonAOP(ProceedingJoinPoint jp) {
		System.out.println("메소드 실행 전");
		try {
			jp.proceed(); //메소드일시중지
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("메소드 실행 후");
	}
	
	@Before("execution(* com.care.root.board.controller.BoardController.writeForm(..))") //실행전메소드
	public void test() {
		System.out.println("글쓰기 on");
	}
	//@After("execution(* com.care.root.board.service.BoardServiceImpl.boardAllList(..))") //실행후 메소드
	Logger LOG = Logger.getGlobal();
	@Around("execution(* com.care.root.board.controller.*.*(..))")
	public Object aop02(ProceedingJoinPoint jp) {
		Object[] params = jp.getArgs();
		for(Object o : params) {
			LOG.log(Level.INFO,"들어온 파라미터값 : "+o);
		}
		Object obj = null;
		try {
			obj = jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		LOG.log(Level.INFO,"실행된 메소드 : "+obj);
		return obj;
	}
	
}
