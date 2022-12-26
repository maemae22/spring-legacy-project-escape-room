package open.sesame.exception;

import lombok.Getter;
import lombok.Setter;
import open.sesame.dto.Member;

// 회원가입시 사용자가 입력한 이메일이 이미 존재하는 경우 예외처리 클래스
@Getter
@Setter
public class MemberExistsException extends Exception{
	private static final long serialVersionUID = 1L;
	
	private Member member;
	
	public MemberExistsException() {
		// TODO Auto-generated constructor stub
	}

	public MemberExistsException(String message, Member member) {
		super(message);
		this.member=member;
	}
	
	
}
