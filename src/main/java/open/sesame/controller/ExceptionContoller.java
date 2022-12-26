package open.sesame.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionContoller {
	private static final Logger logger=LoggerFactory.getLogger(ExceptionContoller.class);
	
	@ExceptionHandler(Exception.class)
	public String userinfoExceptionHandler(Exception exception) {
		logger.error(exception.getMessage());
		return "member/member_error";
	}
}
