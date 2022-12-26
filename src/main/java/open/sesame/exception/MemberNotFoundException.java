package open.sesame.exception;

// 회원정보 변경, 삭제, 검색시 이메일의 회원정보가 없는경우 예외처리 클래스
public class MemberNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public MemberNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberNotFoundException(String message) {
		super(message);
	}
	
}
