package open.sesame.service;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Member;
import open.sesame.exception.LoginAuthFailException;
import open.sesame.exception.MemberExistsException;
import open.sesame.exception.MemberNotFoundException;

public interface MemberService {
	void addMember(Member member) throws MemberExistsException;
	void modifyMember(Member member) throws MemberNotFoundException;
	void removeMember(String memberEmail) throws MemberNotFoundException;
	Member getMember(String memberEmail) throws MemberNotFoundException;
	List<Member> getMemberList(Map<String, Object> map);
	void loginAuth(Member member) throws LoginAuthFailException;
	String findId(String memberPhone);
	Member findPassMember(Member member) throws Exception;
	int emailCheck(String memberEmail);
	int nickCheck(String memberNick);
	int phoneCheck(String memberPhone);
	int getMemberCount();
	public int findPwCheck(Member member)throws Exception;
	public void findPw(String memberEmail,String memberPhone)throws Exception;
	
}
