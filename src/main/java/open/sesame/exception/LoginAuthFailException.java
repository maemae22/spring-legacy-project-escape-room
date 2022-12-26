package open.sesame.exception;

import lombok.Getter;
import lombok.Setter;

// 로그인시 인증 실패 발생했을때 예외처리 클래스
@Getter
@Setter
public class LoginAuthFailException extends Exception {
	private static final long serialVersionUID = 1L;

	private String memberEmail;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}

	public LoginAuthFailException(String message, String memberEmail) {
		super(message);
		this.memberEmail=memberEmail;
	}

}
