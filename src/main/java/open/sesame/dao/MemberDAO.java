package open.sesame.dao;

import java.util.List;
import java.util.Map;

import open.sesame.dto.Member;

public interface MemberDAO {
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String memberEmail);
	Member selectMember(String memberEmail);
	List<Member> selectMemberList(Map<String, Object> map);
	String findId(String memberPhone);
	Member findPass(Member member);
	int emailCheck(String memberEmail);
	int nickCheck(String memberNick);
	int phoneCheck(String memberPhone);
	int findPwCheck(Member member); 
	int findPw(String memberPasswd,String memberEmail,String memberPhone);
	int selectMemberCount();
}
